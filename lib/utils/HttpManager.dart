import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/utils/Code.dart';
import 'package:flutter_std/utils/HttpResponseListener.dart';
import 'package:flutter_std/utils/ResultData.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

///http请求
class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static Map<String, dynamic> optionParams = {
    "cookie": "",
    'Content-type': CONTENT_TYPE_FORM
  };

  ///发起网络请求
  ///[ url] 请求url
  ///[ params] 请求参数
  ///[ header] 外加头
  ///[ option] 配置
  static void netFetch(url, params, HttpResponseListener mHttpResponseListener,
      {isFormData, isShow, methodName, context, TYPE}) async {
    try {
      var connectivityResult = await (new Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        Fluttertoast.showToast(msg: "网络错误");
      }
      if (!url.toString().startsWith("http")) {
        url = Help.BASEURL + "/" + url;
      }

      Dio dio = new Dio();
      if (isShow && context != null) Help.showLoadingDialog(context);
      Response response = TYPE == 'POST'
          ? await dio.post(
              url,
              data: isFormData ? FormData.from(params ?? {}) : params ?? {},
              options: Options(headers: {
                "Accept": "application/json",
                "X-Token": Help.mModelUser?.data?.token
              }, connectTimeout: 5000),
            )
          : TYPE == 'GET'
              ? await dio.get(
                  url,
                  queryParameters:
                      isFormData ? FormData.from(params ?? {}) : params ?? {},
                  options: Options(headers: {
                    "Accept": "application/json",
                    "X-Token": Help.mModelUser?.data?.token
                  }, connectTimeout: 5000),
                )
              : TYPE == 'PUT'
                  ? await dio.put(
                      url,
                      data: isFormData
                          ? FormData.from(params ?? {})
                          : params ?? {},
                      options: Options(headers: {
                        "Accept": "application/json",
                        "X-Token": Help.mModelUser?.data?.token
                      }, connectTimeout: 5000),
                    )
                  : await dio.delete(
                      url,
                      data: isFormData
                          ? FormData.from(params ?? {})
                          : params ?? {},
                      options: Options(headers: {
                        "Accept": "application/json",
                        "X-Token": Help.mModelUser?.data?.token
                      }, connectTimeout: 5000),
                    );

      print(
          '请求url: $url请求参数:${params != null ? params.toString() : ''}返回参数:${response != null ? response.toString() : ''}');
      if (isShow && context != null) Navigator.pop(context);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (!(response.data is Map)) {
          response.data = json.decode(response.toString());
        }
        if (response.data is Map && response.data["code"] == 50008 ||
            response.data["code"] == 50012 ||
            response.data["code"] == 50014) {
          Fluttertoast.showToast(msg: response.data["message"]);
          Help.logOut(context);
          mHttpResponseListener.onFailure(
              methodName,
              new ResultData(
                  response.data, response.toString(), true, Code.SUCCESS,
                  headers: response.headers));
          return;
        }
        if (response.data is Map &&
            response.data.containsKey("Result") &&
            response.data["Result"] != null &&
            !response.data["Result"]) {
          Fluttertoast.showToast(msg: response.data["Message"]);
          mHttpResponseListener.onFailure(
              methodName,
              new ResultData(
                  response.data, response.toString(), true, Code.SUCCESS,
                  headers: response.headers));
          return;
        }
        if (response.data is Map &&
            response.data.containsKey("success") &&
            !response.data["success"]) {
          Fluttertoast.showToast(msg: response.data["message"]);
          mHttpResponseListener.onFailure(
              methodName,
              new ResultData(
                  response.data, response.toString(), true, Code.SUCCESS,
                  headers: response.headers));
          return;
        }

//        if (response.data is Map &&
//            response.data.containsKey("data") &&
//            !response.data["data"]["success"]) {
//          Fluttertoast.showToast(msg: response.data["data"]["message"]);
//          mHttpResponseListener.onFailure(
//              methodName,
//              new ResultData(
//                  response.data, response.toString(), true, Code.SUCCESS,
//                  headers: response.headers));
//          return;
//        }
        mHttpResponseListener.onSuccess(
            methodName,
            new ResultData(
                response.data, response.toString(), true, Code.SUCCESS,
                headers: response.headers));
      } else {
        Fluttertoast.showToast(msg: "请求失败");
        mHttpResponseListener.onFailure(
            methodName,
            new ResultData(
                response.data, response.toString(), true, Code.SUCCESS,
                headers: response.headers));
      }
    } on DioError catch (e) {
      if (isShow && context != null) Navigator.pop(context);
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      if (DEBUG) {
        print('请求异常: $url' + e.toString());
        print('请求异常url: $url请求参数:${params != null ? params.toString() : ''}');
      }
      mHttpResponseListener.onFailure(
          url,
          ResultData(
              Code.errorHandleFunction(errorResponse.statusCode, e.message),
              errorResponse.toString(),
              false,
              errorResponse.statusCode));
    }
  }

  static void downLoad(context, url, savePath, bool isShow,
      ProgressCallback onReceiveProgress) async {
    try {
      Map<PermissionGroup, PermissionStatus> map = await PermissionHandler()
          .requestPermissions([PermissionGroup.storage]);
      var connectivityResult = await (new Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        Fluttertoast.showToast(msg: "网络错误");
      }
      if (!url.toString().startsWith("http")) {
        url = Help.BASEURL + "/" + url;
      }
      print('请求url: ' + url);
      Dio dio = new Dio();
      if (isShow && context != null) Help.showLoadingDialog(context);
      Response response = await dio.download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
        options: Options(
            headers: {"Accept": "application/json"}, connectTimeout: 5000),
      );
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
      if (isShow && context != null) Navigator.pop(context);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (!(response.data is Map) && response is String) {
          response.data = json.decode(response.toString());
        }
        if (response.data is Map &&
            response.data.containsKey("Result") &&
            response.data["Result"] != null &&
            !response.data["Result"]) {
          Fluttertoast.showToast(msg: response.data["Message"]);
          return;
        }
        if (response.data is Map &&
            response.data.containsKey("stateMsg") &&
            response.data["stateMsg"] != null &&
            response.data["stateType"] != 0) {
          Fluttertoast.showToast(msg: response.data["stateMsg"]);
          return;
        }
      } else {
        Fluttertoast.showToast(msg: "请求失败");
      }
    } on DioError catch (e) {
      if (isShow && context != null) Navigator.pop(context);
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      if (DEBUG) {
        print('请求异常: ' + e.toString());
        print('请求异常url: ' + url);
      }
    }
  }
}

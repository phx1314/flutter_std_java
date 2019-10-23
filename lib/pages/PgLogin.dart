import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/model/ModelEmployee.dart';
import 'package:flutter_std/model/ModelGs.dart';
import 'package:flutter_std/model/ModelUser.dart';
import 'package:flutter_std/pages/PgHome.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/GSYStyle.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:udid/udid.dart';

import 'PgChangeIP.dart';
import 'PgSjbd.dart';
import 'PgSound.dart';

class PgLogin extends StatefulWidget {
  static final String sName = "PgLogin";

  @override
  State createState() => new PgLoginState();
}

class PgLoginState extends BaseState<PgLogin> with TickerProviderStateMixin {
  bool obscureText = true;

  //手机号的控制器
  TextEditingController phoneController = TextEditingController();

  //密码的控制器
  TextEditingController passController = TextEditingController();
  String udid;
  AnimationController _controller;
  Animation _animation;
  DataListBean Value = new DataListBean();

  List<DropdownMenuItem> mDropdownMenuItems = new List();

  @override
  void initView() async {
    udid = await Udid.udid;
    reLoad();
  }

  @override
  void loadData() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween(
      begin: 0.5,
      end: 1.0,
    ).animate(_controller);

    loadUrl(METHOD_TENANT_ALL, null, TYPE: 'GET');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(ScreenUtil.getScaleW(context, 40))),
          InkWell(
            onLongPress: () {
              Help.goWhere(context, PgChangeIP());
            },
            child: FadeTransition(
              opacity: _animation,
              child: Image.asset(
                'static/images/logo2.png',
                height: ScreenUtil.getScaleW(context, 75),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(ScreenUtil.getScaleW(context, 5))),
          Text('掌上金曲',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(
                ScreenUtil.getScaleW(context, 30),
                ScreenUtil.getScaleW(context, 50),
                ScreenUtil.getScaleW(context, 30),
                0),
            child: Row(
              children: <Widget>[
                Text(
                  '选择公司',
                  style: Style.text_style_16_black,
                ),
                Padding(
                    padding: EdgeInsets.all(ScreenUtil.getScaleW(context, 13))),
                Expanded(
                  child: DropdownButton(
                    style: Style.text_style_16_black,
                    underline: Divider(height: 1, color: Colors.black),
                    items: mDropdownMenuItems,
                    value: Value,
                    onChanged: (itemValue) {
                      Value = itemValue;
                      reLoad();
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        right: ScreenUtil.getScaleW(context, 40))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                ScreenUtil.getScaleW(context, 30),
                ScreenUtil.getScaleW(context, 40),
                ScreenUtil.getScaleW(context, 80),
                0),
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.all(ScreenUtil.getScaleW(context, 5)),
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.blue,
                  size: ScreenUtil.getScaleW(context, 27),
                ),
                labelText: '请输入用户名',
              ),
              autofocus: false,
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(
                  ScreenUtil.getScaleW(context, 30),
                  ScreenUtil.getScaleW(context, 40),
                  ScreenUtil.getScaleW(context, 30),
                  0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                        controller: passController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.all(ScreenUtil.getScaleW(context, 5)),
                          icon: Icon(
                            Icons.lock,
                            color: Colors.blue,
                            size: ScreenUtil.getScaleW(context, 27),
                          ),
                          labelText: '请输入密码',
                        ),
                        obscureText: obscureText),
                  ),
                  IconButton(
                      icon: Icon(obscureText
                          ? Icons.remove_red_eye
                          : Icons.panorama_fish_eye),
                      onPressed: () {
                        obscureText = !obscureText;
                        reLoad();
                      })
                ],
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(
                ScreenUtil.getScaleW(context, 30),
                ScreenUtil.getScaleW(context, 50),
                ScreenUtil.getScaleW(context, 30),
                0),
            child: RaisedButton(
              shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              elevation: 5,
              padding: EdgeInsets.all(ScreenUtil.getScaleW(context, 12)),
              color: Colors.lightBlue,
              onPressed: () {
                if (phoneController.text.isEmpty) {
                  Fluttertoast.showToast(msg: '请输入用户名');
                  return;
                }
                if (passController.text.isEmpty) {
                  Fluttertoast.showToast(msg: '请输入密码');
                  return;
                }
                loadUrl(METHOD_LOGIN, {
                  "username": phoneController.text,
                  "password": passController.text,
                  "tenantId": Value.id
                });
              },
              child: Text('登录',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  )),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.fromLTRB(0, ScreenUtil.getScaleW(context, 35), 0, 0),
            child: Text('Powerder by JinQu SoftWare',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                )),
          )
        ],
      ),
    );
  }

  @override
  onSuccess(String methodName, res) async {
    if (methodName == METHOD_LOGIN) {
      Help.mModelUser = ModelUser.fromJson(res.data);
      Help.mModelUser.name = phoneController.text;
      Help.mModelUser.password = passController.text;
      Help.mModelUser.tenantId = Value.id;
      loadUrl(METHOD_DEPTANDUSERTREELIST, null, TYPE: 'GET');
    } else if (methodName == METHOD_TENANT_ALL) {
      ModelGs mModelGs = ModelGs.fromJson(res.data);
      mModelGs.data.forEach((f) {
        DropdownMenuItem dropdownMenuItem1 = new DropdownMenuItem(
          child: new Text(f.name),
          value: f,
        );
        mDropdownMenuItems.add(dropdownMenuItem1);
      });
      Value = mModelGs.data[0];
      reLoad();
    } else if (methodName == METHOD_DEPTANDUSERTREELIST) {
      ModelEmployee mModelEmployee = ModelEmployee.fromJson(res.data);
      Help.mModelUser.mModelEmployee = mModelEmployee;
      Help.mModelUser.BaseEmployee = new List();
      mModelEmployee.queryResult.list.forEach((f) {
        f.children?.forEach((son) {
          BaseEmployeeListBean mBaseEmployeeListBean =
              new BaseEmployeeListBean();
          mBaseEmployeeListBean.EmpName = son.name;
          mBaseEmployeeListBean.EmpDepName = f.name;
          mBaseEmployeeListBean.EmpID = son.id;
          mBaseEmployeeListBean.EmpDepID = f.id;
          mBaseEmployeeListBean.EmpName = son.name;
          Help.mModelUser.BaseEmployee.add(mBaseEmployeeListBean);
        });
      });
      await Help.save("mModelUser", json.encode(Help.mModelUser.toJson()));
      Help.pushReplacementNamed(context, PgHome.sName);
    }
  }
}

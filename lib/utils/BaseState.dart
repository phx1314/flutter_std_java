import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/model/ModelCount.dart';
import 'package:flutter_std/utils/HttpManager.dart';
import 'package:flutter_std/utils/HttpResponseListener.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    implements HttpResponseListener {
  @override
  void initState() {
    super.initState();
    Help.mEventBus.on<List>().listen((event) {
      if ((this.toString() == event[0] || this.toString().contains(event[0])) &&
          mounted) {
        print("事件：" + this.toString());
        try {
          disMsg(event[1], event[2]);
        } catch (e) {
          print(e);
        }
      }
    });
    initView();
    loadData();
  }

  void initView() {}

  void loadData() {}

  void disMsg(int what, var data) {}

  void finish() {
    Navigator.pop(context);
  }

  void reLoad() {
    if (mounted) setState(() {});
  }

  @override
  onFailure(String methodName, res) {
    return null;
  }

  @override
  onSuccess(String methodName, res) {
    return null;
  }

  loadUrl(String url, Map<String, dynamic> other,
      {isFormData = false, isShow = true, biaoshi, TYPE = 'POST'}) async {
    await HttpManager.netFetch(url, other, this,
        context: context,
        isFormData: isFormData,
        isShow: isShow,
        methodName: biaoshi ?? url,
        TYPE: TYPE);
  }

  loadUrlSpecial(String url, List other,
      {isFormData = false, isShow = true, biaoshi, TYPE = 'POST'}) async {
    await HttpManager.netFetch(url, other, this,
        context: context,
        isFormData: isFormData,
        isShow: isShow,
        methodName: biaoshi ?? url,
        TYPE: TYPE);
  }
}

import 'dart:convert';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/chat/ChatScreen.dart';
import 'package:flutter_std/item/ItemWork.dart';
import 'package:flutter_std/model/ModelChat.dart';
import 'package:flutter_std/model/ModelWork.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/FontString.dart';
import 'package:flutter_std/utils/PullListView.dart';
import 'package:share/share.dart';

class PgWork extends StatefulWidget {
  @override
  PgWorkState createState() => new PgWorkState();
}

class PgWorkState extends BaseState<PgWork> {
  ModelWork mModelWork;

  @override
  void initView() {
    loadUrl(METHOD_MOBILEMENULIST, null, TYPE: 'GET');
  }

  @override
  void onSuccess(String methodName, res) {
    if (methodName == METHOD_MOBILEMENULIST) {
      mModelWork = ModelWork.fromJson(res.data);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          '工作',
        ),
        leading: Builder(
          builder: (context) => IconButton(
                icon: Icon(Icons.crop_free,
                    size: ScreenUtil.getScaleW(context, 25)),
                onPressed: () {
                  Help.scan(context);
                },
              ),
        ),
        centerTitle: true, //标题是否居中，默认为false
      ),
      body: ListView.separated(
        itemCount: mModelWork == null ? 0 : mModelWork.data.length,
        itemBuilder: (context, index) => ItemWork(mModelWork?.data[index]),
        separatorBuilder: (context, index) => Divider(
              height: 1,
            ),
      ),
    );
  }
}

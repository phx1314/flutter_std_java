import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart' as prefix0;
import 'package:flutter_std/item/ItemFlow.dart';
import 'package:flutter_std/model/ModelFlowList.dart';
import 'package:flutter_std/model/ModelKeys.dart';
import 'package:flutter_std/model/ModelWork.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/PullListView.dart';

import '../Help.dart';
import 'PgXmxxCreate.dart';

class PgFlowList extends StatefulWidget {
  ModelWorkBean item;

  PgFlowList(this.item);

  @override
  State createState() => new PgFlowListState();
}

class PgFlowListState extends BaseState<PgFlowList> {
  PullListView mPullListView;
  String search;
  ModelFlowList mModelFlowList;

  @override
  void disMsg(int what, data) {
    switch (what) {
      case 0:
        mPullListView.reLoad();
        break;
      case 888:
        break;
      case 889:
        break;
    }
  }

  @override
  void initView() {
    mPullListView = PullListView(
      haline: true,
      methodName: METHOD_PROJECTINFOLIST,
      mCallback: (methodName, res) {
        mModelFlowList = ModelFlowList.fromJson(res.data);
        List<String> ids = new List();
        mModelFlowList.queryResult.list.forEach((f) {
          ids.add(f.projId);
        });
        if (ids.length > 0) loadUrlSpecial(METHOD_STATEMAP, ids, isShow: false);
        return List();
      },
    );
  }

  @override
  void onSuccess(String methodName, res) {
    if (methodName == METHOD_STATEMAP) {
      List data = new List();
      mModelFlowList.queryResult.list.forEach((f) {
        if (res.data['data'][f.projId] != null)
          f.stateDesc =
              ModelKeys.fromJson(res.data['data'][f.projId]).stateDesc;
        data.add(ItemFlow(f));
      });
      mPullListView.data.addAll(data);
      mPullListView.setState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.item.menuName),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                size: ScreenUtil.getScaleW(context, 25),
              ),
              onPressed: () {
//                  Help.goWhere(
//                      context,
//                      PgSearch(widget.toString(),
//                          widget.item.mModelMenuConfig.search));
              },
            ),
          ],
        ),
        body: mPullListView,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Help.goWhere(context, PgXmxxCreate(null));
          },
          child: Icon(Icons.add, size: ScreenUtil.getScaleW(context, 40)),
        ));
  }
}

import 'dart:convert';
import 'dart:ui';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/item/ItemFX.dart';
import 'package:flutter_std/item/ItemFlow.dart';
import 'package:flutter_std/model/ModelFlowList.dart';
import 'package:flutter_std/model/ModelFx.dart';
import 'package:flutter_std/model/ModelMenuConfig.dart';
import 'package:flutter_std/model/ModelSearchGk.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/GSYStyle.dart';
import 'package:flutter_std/utils/PullListView.dart';

class PgBd extends StatefulWidget {
  @override
  PgBdState createState() => new PgBdState();
}

class PgBdState extends BaseState<PgBd> {
  PullListView mPullListView;
  String state = '20';

  @override
  void disMsg(int what, data) {
    switch (what) {
      case 0:
        mPullListView.reLoad();
        break;
      case 888:
        List list = (json.decode(data.toString()) as List)
            .map((i) => ModelSearchGk.fromJson(i))
            .toList();
        ModelSearchGk mModelSearchGk = list[0];
        mPullListView.other.addAll({"text": mModelSearchGk.list[0].Value});
        mPullListView.reLoad();
        break;
    }
  }

  @override
  void initView() {
    mPullListView = PullListView(
      haline: true,
      methodName: METHOD_TODOPROJECTFORM,
      other: {
        "state": state,
      },
      mCallback: (methodName, res) {
//        Help.sendMsg("PgHome", 6, '');
        ModelFx mModelFlowList = ModelFx.fromJson(res.data);
        List data = new List();
        mModelFlowList.queryResult.list.forEach((f) {
          data.add(ItemFX(f));
        });
        return data;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    showLefPop();
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '全部',
                          style: Style.text_style_16_gray,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: ScreenUtil.getScaleW(context, 1),
                color: Color(0xFFE0E0E0),
                height: ScreenUtil.getScaleW(context, 40),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    showRightPop();
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          state == '20' ? '未审批' : '已审批',
                          style: Style.text_style_16_gray,
                        ),
                        Icon(Icons.keyboard_arrow_down, color: Colors.grey)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Divider(
            height: ScreenUtil.getScaleW(context, 1),
          ),
          Expanded(
            child: mPullListView,
          )
        ],
      ),
    );
  }

  void showLefPop() async {
    await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(
            0,
            MediaQueryData.fromWindow(window).padding.top +
                AppBar().preferredSize.height +
                ScreenUtil.getScaleW(context, 45),
            0,
            0),
        items: <PopupMenuEntry<String>>[
          PopupMenuItem<String>(value: "0", child: Text('全部')),
        ]).then((v) {
      if (v == null) return;
    });
  }

  void showRightPop() async {
    await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(
            ScreenUtil.getScaleW(context, 100),
            MediaQueryData.fromWindow(window).padding.top +
                AppBar().preferredSize.height +
                ScreenUtil.getScaleW(context, 45),
            0,
            0),
        items: <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: "20",
            child: Container(
                width: ScreenUtil.getScaleW(context, 100), child: Text('未审批')),
          ),
          PopupMenuDivider(height: 1.0),
          PopupMenuItem<String>(value: "30", child: Text('已审批')),
        ]).then((v) {
      if (v == null) return;
      state = v.toString();
      mPullListView.other = {"state": state};
      mPullListView.reLoad();
      reLoad();
    });
  }
}

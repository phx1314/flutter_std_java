import 'dart:convert';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/model/ModelFlowList.dart';
import 'package:flutter_std/model/ModelKeys.dart';
import 'package:flutter_std/pages/PgGzjd.dart';
import 'package:flutter_std/pages/PgXmxxCreate.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/GSYStyle.dart';

class ItemFlow extends StatefulWidget {
  ListListBean item;

  ItemFlow(this.item );

  @override
  ItemFlowState createState() => new ItemFlowState();
}

class ItemFlowState extends BaseState<ItemFlow> {
  List<Widget> mWidgets = List();
  ModelKeys mModelKeys;

  void addWidget(String key, String value) {
    mWidgets.add(Padding(
      padding: EdgeInsets.only(top: 6),
      child: Text(
        '$key  :  $value',
        style: Style.text_style_13_gray,
        softWrap: true,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    try {
      mWidgets.clear();
      addWidget('项目编号', widget.item.projNo);
      addWidget('项目名称', widget.item.projName);
      addWidget('项目负责人', widget.item.projLeaderName);
      addWidget('项目类型', widget.item.projTypeName);
      addWidget('立项时间', Help.getRightDate(widget.item.projApproval ?? 0));
      addWidget(
          '计划完成时间', Help.getRightDate(widget.item.projPlanFinishDate ?? 0));
    } catch (e) {
      print(e);
    }

    return Container(
      padding: EdgeInsets.all(ScreenUtil.getScaleW(context, 12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: ScreenUtil.getScaleW(context, 27),
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("static/images/morentouxiang_n.png"),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: ScreenUtil.getScaleW(context, 12),
                      top: ScreenUtil.getScaleW(context, 5)),
                  child: Text(
                    widget.item.createEmpName ?? '',
                    style: Style.text_style_13_gray,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(ScreenUtil.getScaleW(context, 12)),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(236, 236, 236, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
//                          offset: Offset(ScreenUtil.getScaleW(context, 1),
//                              ScreenUtil.getScaleW(context, 1)),
                        blurRadius: ScreenUtil.getScaleW(context, 1),
//                          spreadRadius: ScreenUtil.getScaleW(context, 1)
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil.getScaleW(context, 4))),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            ScreenUtil.getScaleW(context, 10),
                            0,
                            ScreenUtil.getScaleW(context, 10),
                            ScreenUtil.getScaleW(context, 10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
//                            Text(
//                              item.text ?? '',
//                              style: Style.text_style_16_black,
//                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: mWidgets,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(250, 250, 250, 1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                  ScreenUtil.getScaleW(context, 4)),
                              bottomRight: Radius.circular(
                                  ScreenUtil.getScaleW(context, 4))),
                        ),
                        height: ScreenUtil.getScaleW(context, 40),
                        child: Row(
                          children: <Widget>[
                            Visibility(
                              visible: true,
                              child: Expanded(
                                  child: InkWell(
                                onTap: () {
                                  Help.goWhere(
                                      context, PgGzjd(widget.item.projId));
                                },
                                child: Center(
                                  child: Text(
                                    '查看进度',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              )),
                            ),
                            Container(
                              width: 1,
                              height: double.infinity,
                              color: Color.fromRGBO(236, 236, 236, 1),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Help.goWhere(context,
                                      PgXmxxCreate(widget.item.projId));
                                },
                                child: Center(
                                    child: Text(
                                  widget.item.stateDesc ?? "查看详情",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                  ),
                                )),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/model/ModelFrom.dart';
import 'package:flutter_std/model/ModelKeys.dart';
import 'package:flutter_std/model/ModelNodeUser.dart';
import 'package:flutter_std/pages/PgXzry.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/GSYStyle.dart';

class ItemDialogSub extends StatefulWidget {
  String from;
  String title;
  String taskId;
  List<ModelNodesListBean> item;
  bool data = false;

  ItemDialogSub(this.from, this.title, this.item, this.taskId);

  @override
  ItemDialogSubState createState() => new ItemDialogSubState();
}

class ItemDialogSubState extends BaseState<ItemDialogSub> {
  ModelNodesListBean s_bz;
  DataListBean s_ry;
  TextEditingController mController = TextEditingController(text: '同意');
  bool isHq = false;
  String hqText = '请选择';
  String ids = "";
  ModelNodeUser mModelNodeUser = new ModelNodeUser();

  @override
  void disMsg(int what, data) {
    switch (what) {
      case 101:
        hqText = Help.getNames(data);
        ids = Help.getIDs(data);
        reLoad();
        break;
      case 889:
        widget.data = data;
        break;
    }
  }

//返回城市列表，写法二
  List<DropdownMenuItem> _getItems(List list) {
    List<DropdownMenuItem> items = new List();
    list.forEach((item) {
      items.add(DropdownMenuItem(
        value: item,
        child: Text(() {
          if (item is ModelNodesListBean) {
            return item.nodeName;
          } else if (item is DataListBean) {
            return item.realName;
          }
        }()),
      ));
    });
    return items;
  }

  _onChangedBz(ModelNodesListBean item) {
    s_bz = item;
    selectRy(item.nodeId);
  }

  _onChangedRy(DataListBean value) {
    s_ry = value;
    reLoad();
  }

  @override
  void loadData() {
    s_bz = widget.item[0];
    mModelNodeUser.data = new List()..add(new DataListBean()..realName = '无');
    s_ry = mModelNodeUser.data[0];
    selectRy(widget.item[0].nodeId);
  }

  @override
  onSuccess(String methodName, res) {
    if (methodName == METHOD_FLOWMODELNODE) {
      mModelNodeUser = ModelNodeUser.fromJson(res.data);
      s_ry = mModelNodeUser.data[0];
      reLoad();
    }
  }

  void selectRy(String nodeId) {
    if (nodeId == '' || nodeId == null) {
    } else {
      if (widget.taskId == '' || widget.taskId == null) {
        loadUrl(METHOD_FLOWMODELNODE + "nodeId=$nodeId", null,
            TYPE: 'GET', biaoshi: METHOD_FLOWMODELNODE);
      } else {
        loadUrl(METHOD_FLOWMODELNODE + "taskId=${widget.taskId}&nodeId=$nodeId",
            null,
            TYPE: 'GET', biaoshi: METHOD_FLOWMODELNODE);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency, //透明类型
      child: Padding(
        padding: EdgeInsets.only(
            bottom: widget.data ? ScreenUtil.getScaleH(context, 210) : 0),
        child: Center(
          //保证控件居中效果
          child: new SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
//          height: MediaQuery.of(context).size.height * 0.5,
            child: new Container(
              height: ScreenUtil.getScaleW(context, 330),
              decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(ScreenUtil.getScaleW(context, 15)),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(80, 202, 176, 1),
                          fontSize: 16,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 15, 30, 15),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '步骤',
                          style: Style.text_style_16_black,
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(15, 13, 13, 13)),
                        Expanded(
                          child: DropdownButton(
                            style: Style.text_style_16_black,
                            items: _getItems(widget.item),
                            value: s_bz,
                            onChanged: (itemValue) {
                              _onChangedBz(itemValue);
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
                    padding: EdgeInsets.fromLTRB(40, 10, 30, 15),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '人员',
                          style: Style.text_style_16_black,
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(15, 13, 13, 13)),
                        Expanded(
                          child: isHq
                              ? InkWell(
                                  onTap: () {
                                    Help.goWhere(
                                        context,
                                        PgXzry(
                                          widget.toString(),
                                          ids: ids,
                                        ));
                                  },
                                  child: Text(
                                    hqText,
                                    style: Style.text_style_16_black,
                                  ),
                                )
                              : DropdownButton(
                                  style: Style.text_style_16_black,
                                  items: _getItems(mModelNodeUser.data),
                                  value: s_ry,
                                  onChanged: (itemValue) {
                                    _onChangedRy(itemValue);
                                  },
                                ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                right: ScreenUtil.getScaleW(context, 40))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(40, 10, 15, 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              autofocus: true,
                              controller: mController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(bottom: 5),
                                labelText: '请输入意见',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Help.sendMsg(
                                widget.from,
                                300,
                                new ModelFrom(
                                    widget.title,
                                    s_bz.nodeId,
                                    s_ry.userId,
                                    mController.text,
                                    widget.taskId));
                            finish();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              '确定',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(80, 202, 176, 1),
                                  fontSize: 16,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 30,
                        color: Color(GSYColors.f2f2f2),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            '取消',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(80, 202, 176, 1),
                                fontSize: 16,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

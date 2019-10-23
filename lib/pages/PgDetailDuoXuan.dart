import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/model/ModelDetailBean.dart';
import 'package:flutter_std/model/ModelDx.dart';
import 'package:flutter_std/model/ModelMenuConfig.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/GSYStyle.dart';

class PgDetailDuoXuan extends StatefulWidget {
  ModelDetailBean item;

  PgDetailDuoXuan(this.item);

  @override
  PgDetailDuoXuanState createState() => new PgDetailDuoXuanState();
}

class PgDetailDuoXuanState extends BaseState<PgDetailDuoXuan> {
  @override
  void initView() {
    List<String> data = widget.item.id.split(',');
    widget.item.mModelSysData.queryResult.list.forEach((f) {
      f.isChecked = data.contains(f.itemId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('请选择'),
        centerTitle: true,
        actions: <Widget>[
          InkWell(
            onTap: () {
              widget.item.value = "";
              widget.item.id = "";
              widget.item.mModelSysData.queryResult.list.forEach((f) {
                if (f?.isChecked != null && f?.isChecked) {
                  widget.item.value += f.itemName + ",";
                  widget.item.id += f.itemId.toString() + ",";
                }
              });
              if (widget.item.value.length > 0) {
                widget.item.value = widget.item.value
                    .substring(0, widget.item.value.length - 1);
                widget.item.id =
                    widget.item.id.substring(0, widget.item.id.length - 1);
              }
              reLoad();
              finish();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                '确定',
              ),
            ),
          )
        ],
      ),
      body: ListView.separated(
        itemCount: widget.item.mModelSysData.queryResult.list.length,
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                if (widget
                        .item.mModelSysData.queryResult.list[index].isChecked ==
                    null) {
                  widget.item.mModelSysData.queryResult.list[index].isChecked =
                      true;
                } else {
                  widget.item.mModelSysData.queryResult.list[index].isChecked =
                      !(widget.item.mModelSysData.queryResult.list[index]
                          .isChecked);
                }
                reLoad();
              },
              child: ListTile(
                title: Text(
                  widget.item.mModelSysData.queryResult.list[index].itemName,
                  style: Style.text_style_14_black,
                ),
                trailing: Checkbox(
                  value: widget.item.mModelSysData.queryResult.list[index]
                              .isChecked !=
                          null &&
                      widget
                          .item.mModelSysData.queryResult.list[index].isChecked,
                  onChanged: (v) {
                    if (widget.item.mModelSysData.queryResult.list[index]
                            .isChecked ==
                        null) {
                      widget.item.mModelSysData.queryResult.list[index]
                          .isChecked = true;
                    } else {
                      widget.item.mModelSysData.queryResult.list[index]
                              .isChecked =
                          !(widget.item.mModelSysData.queryResult.list[index]
                              .isChecked);
                    }
                    reLoad();
                  },
                ),
              ),
            ),
        separatorBuilder: (context, index) => Divider(
              height: 1,
            ),
      ),
    );
  }
}

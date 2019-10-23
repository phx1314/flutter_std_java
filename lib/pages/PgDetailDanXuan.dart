import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/model/ModelDetailBean.dart';
import 'package:flutter_std/model/ModelDx.dart';
import 'package:flutter_std/model/ModelMenuConfig.dart';
import 'package:flutter_std/model/ModelSysData.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/GSYStyle.dart';

class PgDetailDanXuan extends StatefulWidget {
  ModelDetailBean item;

  PgDetailDanXuan(this.item);

  @override
  PgDetailDanXuanState createState() => new PgDetailDanXuanState();
}

class PgDetailDanXuanState extends BaseState<PgDetailDanXuan> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('请选择'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: widget.item.mModelSysData.queryResult.list.length,
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                widget.item.value =
                    widget.item.mModelSysData.queryResult.list[index].itemName;
                widget.item.id =
                    widget.item.mModelSysData.queryResult.list[index].itemId;
                reLoad();
                finish();
              },
              child: ListTile(
                title: Text(
                  widget.item.mModelSysData.queryResult.list[index].itemName,
                  style: Style.text_style_14_black,
                ),
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
              ),
            ),
        separatorBuilder: (context, index) => Divider(
              height: 1,
            ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

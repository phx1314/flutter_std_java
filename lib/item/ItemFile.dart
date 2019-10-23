import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/model/ModelFjList.dart';
import 'package:flutter_std/model/ModelProjectInfo.dart';
import 'package:flutter_std/pages/PgFileDetail.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/GSYStyle.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemFile extends StatefulWidget {
  FilesListBean item;
  bool enabled;

  ItemFile(this.item, {this.enabled = false});

  @override
  ItemFileState createState() => new ItemFileState();
}

class ItemFileState extends BaseState<ItemFile> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      enabled: widget.enabled,
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: InkWell(
        onTap: () {
          Help.goWhere(context, PgFileDetail(widget.item));
        },
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "static/images/fujian.png",
                width: ScreenUtil.getScaleH(context, 75),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.all(8),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          widget.item.fileName,
                          overflow: TextOverflow.ellipsis,
                          style: Style.text_style_16_black,
                        ),
                      ),
                      Text(
                        Help.getRollupSize(widget.item.fileSize),
                        style: Style.text_style_13_gray,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                  ),
                  Text(
                    "上传人:${widget.item.createEmpName ?? ""} 上传:${Help.getRightDate(widget.item.createDate ?? 0)}    修改:${Help.getRightDate(widget.item.lastModifiedDate ?? 0)}",
                    style: Style.text_style_13_gray,
                  )
                ],
              ))
            ],
          ),
        ),
      ),
      secondaryActions: <Widget>[
        new IconSlideAction(
          caption: '删除',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            Help.sendMsg('PgFileListEdit', 0, widget.item);
          },
        ),
      ],
    );
  }
}

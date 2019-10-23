import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/model/ModelDetailBean.dart';
import 'package:flutter_std/model/ModelUser.dart';
import 'package:flutter_std/pages/PgDetailDanXuan.dart';
import 'package:flutter_std/pages/PgDetailDuoXuan.dart';
import 'package:flutter_std/pages/PgXzry.dart';
import 'package:flutter_std/pages/PgXzryOne.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/GSYStyle.dart';

class ItemDetailChoose extends StatefulWidget {
  ModelDetailBean mModelDetailBean;

  ItemDetailChoose(this.mModelDetailBean);

  @override
  ItemDetailChooseState createState() => new ItemDetailChooseState();
}

class ItemDetailChooseState extends BaseState<ItemDetailChoose> {
  @override
  void disMsg(int what, data) {
    switch (what) {
      case 101:
        widget.mModelDetailBean.value = Help.getNames(data);
        widget.mModelDetailBean.id = Help.getIDs(data);
        reLoad();
        break;
      case 102:
        widget.mModelDetailBean.value = data.EmpName;
        widget.mModelDetailBean.id = data.EmpID;
        reLoad();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            if (widget.mModelDetailBean.isEnable) {
              if (widget.mModelDetailBean.type == 1) {
                DatePicker.showDatePicker(context,
                    onConfirm: (int year, int month, int date) {
                  widget.mModelDetailBean.value =
                      '$year-${month > 9 ? month : ('0' + month.toString())}-${date > 9 ? date : ('0' + date.toString())}';
                  reLoad();
                });
              } else if (widget.mModelDetailBean.type == 2) {
                Help.goWhere(context, PgXzryOne(this.toString()));
              } else if (widget.mModelDetailBean.type == 3) {
                Help.goWhere(
                    context,
                    PgXzry(
                      this.toString(),
                      ids: widget.mModelDetailBean.id,
                    ));
              } else if (widget.mModelDetailBean.type == 4) {
                if (widget.mModelDetailBean.mModelSysData != null)
                  Help.goWhere(
                      context, PgDetailDanXuan(widget.mModelDetailBean));
              } else if (widget.mModelDetailBean.type == 5) {
                if (widget.mModelDetailBean.mModelSysData != null)
                  Help.goWhere(
                      context, PgDetailDuoXuan(widget.mModelDetailBean));
              }
            }
          },
          child: Padding(
            padding: EdgeInsets.all(ScreenUtil.getScaleW(context, 10)),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: widget.mModelDetailBean.isMust
                      ? Colors.red
                      : Colors.transparent,
                  size: 10,
                ),
                Text(
                  widget.mModelDetailBean.title,
                  style: Style.text_style_16_black,
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: new TextEditingController(
                            text: widget.mModelDetailBean.value),
                        enabled: false,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14,
                            decoration: TextDecoration.none),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(
                                ScreenUtil.getScaleW(context, 5)),
                            hintText: widget.mModelDetailBean.hint,
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                decoration: TextDecoration.none)),
                        autofocus: false,
                      )),
                ),
                Icon(Icons.chevron_right, color: Colors.grey)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

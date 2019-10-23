import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_std/model/ModelDetailBean.dart';
import 'package:flutter_std/model/ModelUser.dart';
import 'package:flutter_std/utils/GSYStyle.dart';

class ItemDetailEditText extends StatelessWidget {
  ModelDetailBean mModelDetailBean;

  ItemDetailEditText(this.mModelDetailBean);

  TextEditingController mController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mController.addListener(() {
      mModelDetailBean.value = mController.text;
    });
    mController.text = mModelDetailBean.value;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(ScreenUtil.getScaleW(context, 8)),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color:
                    mModelDetailBean.isMust ? Colors.red : Colors.transparent,
                size: 10,
              ),
              Text(
                mModelDetailBean.title,
                style: Style.text_style_16_black,
              ),
              Padding(
                  padding: EdgeInsets.all(ScreenUtil.getScaleW(context, 5))),
              Expanded(
                child: TextField(
                  controller: mController,
                  enabled: mModelDetailBean.isEnable,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 14,
                      decoration: TextDecoration.none),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.all(ScreenUtil.getScaleW(context, 5)),
                      hintText: mModelDetailBean.hint,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          decoration: TextDecoration.none)),
                  autofocus: false,
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}

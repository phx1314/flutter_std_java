import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_std/model/ModelUser.dart';
import 'package:flutter_std/utils/GSYStyle.dart';

class ItemDetailTitle extends StatelessWidget {
  String title;

  ItemDetailTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(ScreenUtil.getScaleW(context, 15)),
          child: Text(
            title,
            style: Style.text_style_16_black,
          ),
        ),
      ],
    );
  }
}

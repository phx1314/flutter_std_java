import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_std/model/ModelWork.dart';
import 'package:flutter_std/pages/PgFlowList.dart';
import 'package:flutter_std/utils/FontString.dart';
import 'package:flutter_std/utils/GSYStyle.dart';

import '../Help.dart';

class ItemWorkSon extends StatelessWidget {
  ModelWorkBean item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _onTap(context);
      },
      child: Container(
        padding: EdgeInsets.all(ScreenUtil.getScaleW(context, 10)),
        width: ScreenUtil.getScaleW(context, 85),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
//                boxShadow: [
//                  BoxShadow(
//                      color: Colors.grey,
//                      offset: Offset(ScreenUtil.getScaleW(context, 2),
//                          ScreenUtil.getScaleW(context, 2)),
//                      blurRadius: ScreenUtil.getScaleW(context, 5),
//                      spreadRadius: ScreenUtil.getScaleW(context, 1)),
//                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: ScreenUtil.getScaleW(context, 30),
                backgroundColor: Colors.blue,
                child: Icon(
                  IconData(FontString.data['fa_file'],
                      fontFamily: FontString.fontFamily),
                  size: ScreenUtil.getScaleW(context, 27),
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: ScreenUtil.getScaleW(context, 7),
            ),
            Text(
              item.menuName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Style.text_style_13_gray,
            )
          ],
        ),
      ),
    );
  }

  ItemWorkSon(this.item);

  _onTap(BuildContext context) {
    if (item.children != null) {
      showDiaolg(context);
//      WidgetsBinding.instance.addPostFrameCallback((_) => showDiaolg(context));
    } else {
      go2Where(context);
    }
  }

  void go2Where(BuildContext context) {
    try {
      Navigator.pop(context);
      if (item.menuCode == "PROJ0101") {//项目信息登记
        Help.goWhere(context, PgFlowList(item));
      }
    } catch (e) {
      print(e);
    }

//    if (item.MenuNameEng == "MailReceive") {
//      Navigator.pop(context);
//    } else if (item.MenuNameEng == "OaCheckList") {
//      Navigator.pop(context);
//      return;
//    } else if (item.MenuNameEng == "MailSend") {
//      //发件箱
//      Navigator.pop(context);
//    } else if (item.MenuNameEng == "MailDraft") {
//      //草稿箱
//      Navigator.pop(context);
//    } else if (item.MenuNameEng == "MailJunk") {
//      //垃圾箱
//      Navigator.pop(context);
//    } else if (item.MenuNameEng == "MailWrite") {
//      //写邮件
//      Navigator.pop(context);
//    } else if (item.MenuNameEng == "OaNewsInfo") {
//      //新闻管理
//      Navigator.pop(context);
//      Help.sendMsg("PgHome", 1, 3);
//    } else if (item.MenuNameEng == "LoginLog") {
//      //审计
//      Navigator.pop(context);
//      Help.goWhere(context, PgRz(1));
//    } else if (item.MenuNameEng == "BUSSLog") {
//      //业务
//      Navigator.pop(context);
//      Help.goWhere(context, PgRz(0));
//    } else if (item.MenuNameEng == "OaScheduler") {
//      //工作
//    } else {
//      if (item.mModelMenuConfig != null) {
//        Navigator.pop(context);
//        Help.goWhere(context, PgFlowList(item));
//      }
//    }
  }

  void showDiaolg(BuildContext context) {
    List<Widget> mWidgets = new List();
    item.children.forEach((f) {
      mWidgets.add(
        ItemWorkSon(f),
      );
    });
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(item.menuName),
              titleTextStyle: Style.text_style_16_black,
              titlePadding: EdgeInsets.all(ScreenUtil.getScaleW(context, 17)),
              contentPadding: EdgeInsets.all(ScreenUtil.getScaleW(context, 2)),
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: ScreenUtil.getScaleW(context, 300),
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      Divider(height: ScreenUtil.getScaleW(context, 1)),
                      Wrap(
                        spacing: ScreenUtil.getScaleW(context, 4),
                        // gap between adjacent chips
                        runSpacing: ScreenUtil.getScaleW(context, 2),
                        // gap between lines
                        children: mWidgets,
                      )
                    ],
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(ScreenUtil.getScaleW(context, 12))),
              ),
            ));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/model/ModelCount.dart';
import 'package:flutter_std/pages/PgGrzl.dart';
import 'package:flutter_std/pages/PgSet.dart';
import 'package:flutter_std/pages/PgWebView.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/GSYStyle.dart';

class PgWode extends StatefulWidget {
  @override
  PgWodeState createState() => new PgWodeState();
}

class PgWodeState extends BaseState<PgWode> {
  ModelCount mModelCount;

  @override
  void initState() {
    super.initState();
//    PaintingBinding.instance.imageCache
//    loadUrl(METHOD_GetMails, null, isShow: false);
  }

  @override
  void disMsg(int what, data) {
    switch (what) {
      case 0:
//        loadUrl(METHOD_GetMails, null, isShow: false);
        break;
    }
  }

  @override
  onSuccess(String methodName, res) {
  }

  @override
  Widget build(BuildContext context) {
    Widget top = InkWell(
      onTap: () {
        Help.goWhere(context, PgGrzl(Help.mModelUser?.data?.userId));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(
            ScreenUtil.getScaleW(context, 12),
            ScreenUtil.getScaleW(context, 12),
            ScreenUtil.getScaleW(context, 17),
            ScreenUtil.getScaleW(context, 12)),
        margin: EdgeInsets.all(ScreenUtil.getScaleW(context, 12)),
        decoration: BoxDecoration(
          border: Border.all(width: 0.3, color: Colors.grey),
//          color: Colors.white,
//          boxShadow: [
//            BoxShadow(
//                color: Colors.grey,
//                offset: Offset(ScreenUtil.getScaleW(context, 2),
//                    ScreenUtil.getScaleW(context, 2)),
//                blurRadius: ScreenUtil.getScaleW(context, 5),
//                spreadRadius: 1),
//          ],
          borderRadius: BorderRadius.all(
              Radius.circular(ScreenUtil.getScaleW(context, 4))),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        Help.mModelUser?.data?.userName ?? '',
                        style: Theme.of(context).textTheme.title,
                      ),
                      Container(
                        width: ScreenUtil.getScaleW(context, 5),
                      ),
                      Text(
                        '',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle,
                      )
                    ],
                  ),
                  Padding(
                      padding:
                          EdgeInsets.all(ScreenUtil.getScaleW(context, 10))),
                  Text(
                    Help.mModelUser?.data?.deptName ?? '',
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.subtitle,
                  ),
//                  Padding(
//                      padding:
//                          EdgeInsets.all(ScreenUtil.getScaleW(context, 2))),
//                  Text(
//                    Help.mModelUser?.data?.EmpTel ?? '',
//                    style: Theme.of(context).textTheme.subtitle,
//                  ),
//                  Padding(
//                      padding:
//                          EdgeInsets.all(ScreenUtil.getScaleW(context, 2))),
//                  Text(
//                    Help.mModelUser?.UserInfo?.EmpNote ?? '',
//                    style: Theme.of(context).textTheme.subtitle,
//                  ),
                ],
              ),
            ),
//            CircleAvatar(
//              radius: ScreenUtil.getScaleW(context, 27),
//              backgroundColor: Colors.transparent,
//              backgroundImage: CachedNetworkImageProvider(
//                  Help.ImageUrl +
//                      (Help.mModelUser?.UserInfo?.EmpHead != null &&
//                              Help.mModelUser?.UserInfo?.EmpHead != ''
//                          ? Help.mModelUser?.UserInfo?.EmpHead
//                          : '0'),
//                  cacheManager: Help.mImageCacheManager),
//            ),
          ],
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "我的",
          ),
          leading: Builder(
            builder: (context) => IconButton(
                  icon: Icon(Icons.crop_free,
                      size: ScreenUtil.getScaleW(context, 25)),
                  onPressed: () {
                    Help.scan(context);
                  },
                ),
          ),
          centerTitle: true, //标题是否居中，默认为false
        ),
        body: ListView(
          children: <Widget>[
            top,
            ListTile(
              onTap: () {
                Help.goWhere(context, PgWebView('http://www.jinqu.cn/'));
              },
              leading: Image.asset('static/images/bangzhu.png',
                  width: ScreenUtil.getScaleW(context, 22),
                  height: ScreenUtil.getScaleW(context, 22)),
              title: const Text('帮助中心'),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
            ),
            Divider(height: 1),
            ListTile(
              onTap: () {
                Help.goWhere(
                    context,
                    PgWebView(
                        'http://www.jinqu.cn:2016/channel.aspx?id=11#jq_4'));
              },
              leading: Image.asset('static/images/kefu.png',
                  width: ScreenUtil.getScaleW(context, 22),
                  height: ScreenUtil.getScaleW(context, 22)),
              title: const Text('联系客服'),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
            ),
            Container(
              height: ScreenUtil.getScaleW(context, 7),
              color: Color(GSYColors.f2f2f2),
            ),
            ListTile(
              onTap: () {
                Help.goWhere(context, PgSet());
              },
              leading: Image.asset('static/images/shezhi.png',
                  width: ScreenUtil.getScaleW(context, 22),
                  height: ScreenUtil.getScaleW(context, 22)),
              title: const Text('设置'),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
            ),
            Container(
              height: ScreenUtil.getScaleW(context, 7),
              color: Color(GSYColors.f2f2f2),
            ),
          ],
        ));
  }

  void sousuo() {}
}

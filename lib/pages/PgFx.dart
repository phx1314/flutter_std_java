import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/model/ModelMenuConfig.dart';
import 'package:flutter_std/pages/PgBd.dart';
import 'package:flutter_std/utils/BaseState.dart';

import 'PgRc.dart';
import 'PgSearch.dart';

class PgFx extends StatefulWidget {
  @override
  PgFxState createState() => new PgFxState();
}

class PgFxState extends BaseState<PgFx> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '发现',
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
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                size: ScreenUtil.getScaleW(context, 25),
              ),
              onPressed: () {
//                List<SearchListBean> search = List();
//                SearchListBean s1 = new SearchListBean();
//                s1.type = "text";
//                s1.text = "请输入标题、流程名称、节点名称";
//                s1.sqlstring =
//                    '{"isGroup":false,"list":[{"Key":"NewsTitle,NewsContent","Contract":"like","Value":"#{value}"}]}';
//                search.add(s1);
//                Help.goWhere(context, PgSearch('PgBd', search));
              },
            ),
          ],
          centerTitle: true,
        ),
        body: TabBarView(
          children: [PgBd()],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

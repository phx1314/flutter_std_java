import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/item/ItemHt.dart';
import 'package:flutter_std/model/ModelMenuConfig.dart';
import 'package:flutter_std/model/ModelXm.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/PullListView.dart';

import 'PgSearch.dart';

class PgXmList extends StatefulWidget {
  PgXmList();

  @override
  PgXmListState createState() => new PgXmListState();
}

class PgXmListState extends BaseState<PgXmList> {
  PullListView mPullListView;

  @override
  void initView() {
    mPullListView = PullListView(
      methodName: METHOD_JSONCHOOSEPROJECT,
      mCallback: (methodName, res) {
        ModelXm mModelFlowList = ModelXm.fromJson(res.data);
        List data = new List();
        mModelFlowList.rows.forEach((f) {
          data.add(ItemHt(f));
        });
        return data;
      },
    );
  }

  @override
  void disMsg(int what, data) {
    switch (what) {
      case 888:
        Map<String, dynamic> map = {"queryInfo": data.toString()};
        mPullListView.other = map;
        mPullListView.reLoad();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('项目列表'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: ScreenUtil.getScaleW(context, 25),
            ),
            onPressed: () {
              List<SearchListBean> search = List();
              SearchListBean s1 = new SearchListBean();
              s1.type = "text";
              s1.text = "请输入项目名称";
              s1.sqlstring =
                  '{"isGroup":false,"list":[{"Key":"txtLike","Contract":"like","Value":"#{value}"}]}';
              search.add(s1);
              Help.goWhere(context, PgSearch(widget.toString(), search));
            },
          ),
        ],
      ),
      body: mPullListView,
    );
  }
}

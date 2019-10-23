import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/item/ItemGzjd.dart';
import 'package:flutter_std/model/ModelGzjd.dart';
import 'package:flutter_std/model/ModelKeys.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/PullListView.dart';

class PgGzjd extends StatefulWidget {
  String projId;

  PgGzjd(this.projId);

  @override
  PgGzjdState createState() => new PgGzjdState();
}

class PgGzjdState extends BaseState<PgGzjd> {
  List<TasksListBean> data = new List();
  ModelKeys mModelKeys;

  @override
  void initView() {
    if (widget.projId != '' && widget.projId != null)
      loadUrlSpecial(METHOD_DETAILBYBUSINESSKEYS, [widget.projId],
          isShow: false);
  }

  @override
  void onSuccess(String methodName, res) {
    if (methodName == METHOD_DETAILBYBUSINESSKEYS) {
      if (res.data['data'].length == 0) {
      } else {
        mModelKeys = ModelKeys.fromJson(res.data['data'][widget.projId]);
        for (int i = mModelKeys.tasks.length - 1; i >= 0; i--) {
          data.add(mModelKeys.tasks[i]);
        }
        reLoad();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('审批进度'),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemCount: data.length,
          separatorBuilder: (context, index) => Divider(
                height: 1,
              ),
          // 添加分割线
          itemBuilder: (context, index) {
            try {
              return ItemGzjd(data[index], index);
            } catch (e) {
              return Container();
            }
          },
        ));
  }
}

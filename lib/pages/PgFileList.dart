import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/item/ItemFile.dart';
import 'package:flutter_std/model/ModelFjList.dart';
import 'package:flutter_std/model/ModelProjectInfo.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/PullListView.dart';

class PgFileList extends StatefulWidget {
  List<FilesListBean> files;

  PgFileList(this.files);

  @override
  PgFileListState createState() => new PgFileListState();
}

class PgFileListState extends BaseState<PgFileList> {
  @override
  void initView() {
    if (widget.files == null) {
      widget.files = List();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('附件列表'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: widget.files.length,
        separatorBuilder: (context, index) => Divider(
              height: 1,
            ),
        // 添加分割线
        itemBuilder: (context, index) {
          return ItemFile(widget.files[index]);
        },
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/item/ItemFile.dart';
import 'package:flutter_std/model/ModelFileNum.dart';
import 'package:flutter_std/model/ModelFjList.dart';
import 'package:flutter_std/model/ModelProjectInfo.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/TakePhoto.dart';
import 'PgMap.dart';
import 'PgSound.dart';

class PgFileListEdit extends StatefulWidget {
  List<FilesListBean> files = new List();

  PgFileListEdit(this.files);

  @override
  PgFileListEditState createState() => new PgFileListEditState();
}

class PgFileListEditState extends BaseState<PgFileListEdit> {
  List<Widget> mWidgets = new List();
  File file;

  @override
  void disMsg(int what, data) {
    switch (what) {
      case 0:
        FilesListBean mRowsListBean = data;
        loadUrl(METHOD_DELETE + mRowsListBean.fileId, null,
            TYPE: 'DELETE', biaoshi: METHOD_DELETE);
        widget.files.remove(mRowsListBean);
        reLoad();
//        Help.sendMsg(widget.form, 0, "");
        break;
      case 1:
        file = data;
        upLoadFile();
        break;
    }
  }

  void upLoadFile() {
    if (file != null) {
      loadUrl(
          METHOD_UPLOAD,
          {
            "file": UploadFileInfo(file, file.path.split('/')[file.path.split('/').length-1]),
          },
          isFormData: true);
    }
  }

  @override
  void initView() {
    FILE_DATA.forEach((f) {
      if (f == '音频文件') {
        mWidgets.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "static/images/yinpin.png",
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            ),
            Padding(padding: EdgeInsets.all(5)),
            Text(f)
          ],
        ));
      }
      if (f == '图片拍照') {
        mWidgets.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "static/images/weizhi.png",
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            ),
            Padding(padding: EdgeInsets.all(5)),
            Text(f)
          ],
        ));
      }
    });
  }

  @override
  void onSuccess(String methodName, res) async {
    if (methodName == METHOD_UPLOAD) {
      FilesListBean mFilesListBean = FilesListBean.fromJson(res.data['data']);
      mFilesListBean.createEmpName=Help.mModelUser.data.userName;

      widget.files.add(mFilesListBean);
      Help.Toast(context, "文件上传成功");
      reLoad();
//      Help.sendMsg(
//          widget.form,
//          0,
//          jsonEncode(
//              ModelFileNum(refTable: widget.refTable, fileNumber: fileNumber)));
    } else if (methodName == METHOD_DELETE) {
      Help.Toast(context, '删除成功');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('附件列表'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_vert,
                size: ScreenUtil.getScaleW(context, 25),
              ),
              onPressed: () {
                Help.showPop(
                  context,
                  FILE_DATA,
                  (f) {
                    if (f == '音频文件') {
                      Help.goWhere(context, PgSound());
                    } else if (f == '图片拍照') {
                      Help.showMyDialog(context, TakePhoto((file) {
                        this.file = file;
                        upLoadFile();
                      }));
                    }
                  },
                  left: 1,
                  child: mWidgets,
                );
              },
            ),
          ]),
      body: ListView.separated(
        itemCount: widget.files.length,
        itemBuilder: (context, index) => ItemFile(
              widget.files[index],
              enabled: true,
            ),
        separatorBuilder: (context, index) => Divider(
              height: 1,
            ),
      ),
    );
  }
}

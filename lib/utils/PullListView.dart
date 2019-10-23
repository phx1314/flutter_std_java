import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/GSYStyle.dart';
import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PullListView extends StatefulWidget {
  var haline;

  var methodName;
  var methodName_start;
  var biaoShi;
  var head;
  var isFirstLoad;
  Callback mCallback;
  bool loadMoreEnable;
  bool isLoading = false;
  Map<String, dynamic> other;
  List data = new List();
  PullListViewState mPullListViewState = new PullListViewState();

  reLoad() {
    mPullListViewState.refreash();
  }

  setState() {
    mPullListViewState.setState(() {});
  }

  PullListView({
    Key key,
    @required this.methodName,
    @required this.mCallback,
    this.isFirstLoad = true,
    this.head,
    this.biaoShi,
    this.other,
    this.haline = true,
    this.loadMoreEnable = true,
  }) : super(key: key);

  @override
  PullListViewState createState() => mPullListViewState;
}

typedef Callback = List Function(String methodName, dynamic res);

class PullListViewState extends BaseState<PullListView>
    with AutomaticKeepAliveClientMixin {
  int page = 1;

  @override
  void initState() {
    print("PullListViewinitState");
    if (widget.isFirstLoad) {
      widget.other ??= Map();
      widget.methodName_start = widget.methodName + "/";
      widget.methodName = widget.methodName_start + page.toString() + "/10";
      refreash();
      widget.isFirstLoad = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.data.length <= 0) {
      return Center(
        child: Visibility(
          child: CupertinoActivityIndicator(),
          visible: widget.isLoading,
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(bottom: ScreenUtil.getScaleW(context, 7)),
        child: Refresh(
          child: ListView.separated(
            itemCount: widget.head != null
                ? widget.data.length + 1
                : widget.data.length,
            separatorBuilder: (context, index) => Visibility(
                  child: Container(
                    height: 1,
                    color: Color(GSYColors.f2f2f2),
                  ),
                  visible: widget.haline,
                ),
            // 添加分割线
            itemBuilder: (context, index) {
              try {
                if (widget.head == null) {
                  return widget.data[index];
                } else {
                  if (index == 0) {
                    return widget.head;
                  } else {
                    return widget.data[index - 1];
                  }
                }
              } catch (e) {
                return Container();
              }
            },
          ),
          onHeaderRefresh: _onHeaderRefresh,
          onFooterRefresh: widget.loadMoreEnable ? _onFooterRefresh : null,
        ),
      );
    }
  }

  refreash({bool isShow = true}) {
    page = 1;
    widget.methodName = widget.methodName_start + page.toString() + "/10";
    widget.data.clear();
    widget.isLoading = true;
    if (isShow) reLoad();
    widget.biaoShi != null
        ? loadUrl(widget.methodName, widget.other,
            isShow: false, biaoshi: widget.biaoShi, TYPE: 'GET')
        : loadUrl(widget.methodName, widget.other, isShow: false, TYPE: 'GET');
  }

  Future<Null> _onHeaderRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      print("上拉刷新加载");
      refreash(isShow: false);
    });
  }

  Future<Null> _onFooterRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      print("加载更多");
      widget.biaoShi != null
          ? loadUrl(widget.methodName, widget.other,
              isShow: false, biaoshi: widget.biaoShi, TYPE: 'GET')
          : loadUrl(widget.methodName, widget.other,
              isShow: false, TYPE: 'GET');
      widget.isLoading = true;
    });
  }

  @override
  onSuccess(String methodName, res) {
    List dd = widget.mCallback(widget.methodName, res);
    if (dd.length > 0) {
      page++;
      widget.methodName = widget.methodName_start + page.toString() + "/10";
      widget.data.addAll(dd);
    } else {
      if (widget.data.length > 0) {
        Fluttertoast.showToast(msg: "暂无更多数据");
      }
    }
    widget.isLoading = false;
    reLoad();
  }

  @override
  bool get wantKeepAlive => true;
}

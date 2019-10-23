import 'package:flutter/material.dart';
import 'package:flutter_std/az/az_common.dart';
import 'package:flutter_std/az/index_bar.dart';
import 'package:flutter_std/az/suspension_view.dart';

/// Called to build children for the listview.
typedef Widget ItemWidgetBuilder(BuildContext context, ISuspensionBean model);

/// Called to build IndexBar.
typedef Widget IndexBarBuilder(
    BuildContext context, List<String> tags, IndexBarTouchCallback onTouch);

/// Called to build index hint.
typedef Widget IndexHintBuilder(BuildContext context, String hint);

/// _Header.
class _Header extends ISuspensionBean {
  String tag;

  @override
  String getSuspensionTag() => tag;

  @override
  bool get isShowSuspension => false;
}

/// AzListView.
class AzListView extends StatefulWidget  {
  AzListView(
      {Key key,
      this.data,
      this.topData,
      this.itemBuilder,
      this.suspensionWidget,
      this.isUseRealIndex: true,
      this.itemHeight: 50,
      this.suspensionHeight: 40,
      this.onSusTagChanged,
      this.header,
      this.indexBarBuilder,
      this.indexHintBuilder,
      this.showIndexHint: true})
      : assert(itemBuilder != null),
        super(key: key);

  ///with ISuspensionBean Data
  final List<ISuspensionBean> data;

  ///with ISuspensionBean topData, Do not participate in [A-Z] sorting (such as hotList).
  final List<ISuspensionBean> topData;

  final ItemWidgetBuilder itemBuilder;

  ///suspension widget.
  final Widget suspensionWidget;

  ///is use real index data.(false: use INDEX_DATA_DEF)
  final bool isUseRealIndex;

  ///item Height.
  final int itemHeight;

  ///suspension widget Height.
  final int suspensionHeight;

  ///on sus tag change callback.
  final ValueChanged<String> onSusTagChanged;

  final AzListViewHeader header;

  final IndexBarBuilder indexBarBuilder;

  final IndexHintBuilder indexHintBuilder;

  final bool showIndexHint;

  @override
  State<StatefulWidget> createState() {
    return new _AzListViewState();
  }
}

class _AzListViewState extends State<AzListView>with AutomaticKeepAliveClientMixin
{
  Map<String, int> _suspensionSectionMap = Map();
  List<ISuspensionBean> _cityList = List();
  List<String> _indexTagList = List();
  bool _isShowIndexBarHint = false;
  String _indexBarHint = "";

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onIndexBarTouch(IndexBarDetails model) {
    setState(() {
      _indexBarHint = model.tag;
      _isShowIndexBarHint = model.isTouchDown;
      int offset = _suspensionSectionMap[model.tag];
      if (offset != null) {
        _scrollController.jumpTo(offset
            .toDouble()
            .clamp(.0, _scrollController.position.maxScrollExtent));
      }
    });
  }

  void _init() {
    _cityList.clear();
    if (widget.topData != null && widget.topData.isNotEmpty) {
      _cityList.addAll(widget.topData);
    }
    List<ISuspensionBean> list = widget.data;
    if (list != null && list.isNotEmpty) {
//      SuspensionUtil.sortListBySuspensionTag(list);
      _cityList.addAll(list);
    }

    SuspensionUtil.setShowSuspensionStatus(_cityList);

    if (widget.header != null) {
      _cityList.insert(0, _Header()..tag = widget.header.tag);
    }
    _indexTagList.clear();
    if (widget.isUseRealIndex) {
      _indexTagList.addAll(SuspensionUtil.getTagIndexList(_cityList));
    } else {
      _indexTagList.addAll(INDEX_DATA_DEF);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _init();
    var children = <Widget>[
      SuspensionView(
        data: widget.header == null ? _cityList : _cityList.sublist(1),
        contentWidget: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            itemCount: _cityList.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0 && _cityList[index] is _Header) {
                return SizedBox(
                    height: widget.header.height.toDouble(),
                    child: widget.header.builder(context));
              }
              return widget.itemBuilder(context, _cityList[index]);
            }),
        suspensionWidget: widget.suspensionWidget,
        controller: _scrollController,
        suspensionHeight: widget.suspensionHeight,
        itemHeight: widget.itemHeight,
        onSusTagChanged: widget.onSusTagChanged,
        header: widget.header,
        onSusSectionInited: (Map<String, int> map) =>
            _suspensionSectionMap = map,
      )
    ];

    Widget indexBar;
    if (widget.indexBarBuilder == null) {
      indexBar = IndexBar(
        data: _indexTagList,
        width: 36,
        onTouch: _onIndexBarTouch,
      );
    } else {
      indexBar = widget.indexBarBuilder(
        context,
        _indexTagList,
        _onIndexBarTouch,
      );
    }
    children.add(Align(
      alignment: Alignment.centerRight,
      child: indexBar,
    ));
    Widget indexHint;
    if (widget.indexHintBuilder != null) {
      indexHint = widget.indexHintBuilder(context, '$_indexBarHint');
    } else {
      indexHint = Card(
        color: Colors.black54,
        child: Container(
          alignment: Alignment.center,
          width: 80.0,
          height: 80.0,
          child: Text(
            '$_indexBarHint',
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    if (_isShowIndexBarHint && widget.showIndexHint) {
      children.add(Center(
        child: indexHint,
      ));
    }

    return new Stack(children: children);
  }

//  @override
//  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

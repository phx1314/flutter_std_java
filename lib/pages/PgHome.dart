import 'dart:async';
import 'dart:convert';

import 'package:bottom_tab_bar/bottom_tab_bar.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_std/Help.dart';
import 'package:flutter_std/model/ModelAA.dart';
import 'package:flutter_std/model/ModelCount.dart';
import 'package:flutter_std/model/ModelCustomer.dart';
import 'package:flutter_std/model/ModelEmployee.dart';
import 'package:flutter_std/model/ModelMenuConfig.dart';
import 'package:flutter_std/model/ModelSysData.dart';
import 'package:flutter_std/model/ModelUser.dart';
import 'package:flutter_std/model/ModelVersion.dart';
import 'package:flutter_std/model/ModelWork.dart';
import 'package:flutter_std/pages/PgFx.dart';
import 'package:flutter_std/pages/PgWode.dart';
import 'package:flutter_std/pages/PgWork.dart';
import 'package:flutter_std/pages/PgXx.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/GSYStyle.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

import 'PageDialogLock.dart';
import 'PgXzry.dart';

class PgHome extends StatefulWidget {
  static final String sName = "PgHome";

//  https://github.com/GanZhiXiong/GZXTaoBaoAppFlutter
  @override
  State<StatefulWidget> createState() {
    return PgHomeState();
  }
}

class PgHomeState extends BaseState<PgHome> with WidgetsBindingObserver {
  int _tabIndex = 0;
  var appBarTitles = ['工作', '发现', '消息', '我的'];
  ModelCount mModelCount;
  int _lastClickTime = 0;
  int xxCount = 0;
  ModelAA mModelAA;

  Future<bool> _doubleExit() {
    int nowTime = new DateTime.now().microsecondsSinceEpoch;
    if (_lastClickTime != 0 && nowTime - _lastClickTime > 1500) {
      return new Future.value(true);
    } else {
      Help.Toast(context, '再按一次，退出程序');
      _lastClickTime = new DateTime.now().microsecondsSinceEpoch;
      new Future.delayed(const Duration(milliseconds: 1500), () {
        _lastClickTime = 0;
      });
      return new Future.value(false);
    }
  }

  void _changeTab(int index) {
    _tabIndex = index;
    reLoad();
  }

  @override
  onSuccess(String methodName, res) {
    if (methodName == METHOD_GetWork) {
      Help.mModelWorkBeans = List();
      ModelWork mModelWork = ModelWork.fromJson(res.data);
//      addSon(mModelWork.rows);
      Help.sendMsg("PgBd", 0, '');
    } else if (methodName == METHOD_UPDATE) {
      ModelVersion mModelVersion = ModelVersion.fromJson(res.data);
      PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
        if (packageInfo.version != mModelVersion.data.buildVersion) {
          Help.showAlertDialog(context, '发现新版本，是否更新', () {
            launch(mModelVersion.data.buildShortcutUrl);
          });
        }
      });
    } else if (methodName == METHOD_GetAmount) {
      mModelAA = ModelAA.fromJson(res.data);
      reLoad();
    } else if (methodName == 'PROJECT_TYPE') {
      Help.mModelSysData_PROJECT_TYPE = ModelSysData.fromJson(res.data);
    } else if (methodName == 'CUSTOMER_REGION') {
      Help.mModelSysData_CUSTOMER_REGION = ModelSysData.fromJson(res.data);
    } else if (methodName == 'GENGER') {
      Help.mModelSysData_GENGER = ModelSysData.fromJson(res.data);
    } else if (methodName == 'TASK_TYPE') {
      Help.mModelSysData_TASK_TYPE = ModelSysData.fromJson(res.data);
    } else if (methodName == 'URGENCY_DEEP') {
      Help.mModelSysData_URGENCY_DEEP = ModelSysData.fromJson(res.data);
    } else if (methodName == 'TASK_SHAPE') {
      Help.mModelSysData_TASK_SHAPE = ModelSysData.fromJson(res.data);
    } else if (methodName == 'TASK_SOURCE') {
      Help.mModelSysData_TASK_SOURCE = ModelSysData.fromJson(res.data);
    } else if (methodName == METHOD_GETCUSTOMERS) {
      Help.mModelSysData_METHOD_GETCUSTOMERS = ModelCustomer.fromJson(res.data);
    }
  }

  void addSon(List<ModelWorkBean> rows) {
//    rows.forEach((item) {
//      if (item.MenuMobileConfig != "{}") {
//        item.mModelMenuConfig =
//            ModelMenuConfig.fromJson(json.decode(item.MenuMobileConfig));
//        Help.mModelWorkBeans.add(item);
//      }
//      if (item.children != null) addSon(item.children);
//    });
  }

  @override
  void initState() {
    super.initState();
    JPush mJPush = JPush();
    mJPush.setAlias(Help.mModelUser.data.userId);
//    loadUrl(METHOD_GetWork, null, isShow: false);
//    loadUrl(METHOD_GetAmount, {"app": "1"}, isShow: false);
    loadUrl(
        METHOD_UPDATE,
        {
          "_api_key": apikey,
          "appKey": defaultTargetPlatform == TargetPlatform.android
              ? appKey
              : appKeyIos
        },
        isShow: false,
        isFormData: true);
    WidgetsBinding.instance.addObserver(this);
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        Help.sendMsg('PgPubView,ItemDialogSub', 889, visible);
      },
    );

    loadUrl(METHOD_SYSDATA + 'PROJECT_TYPE', null,
        biaoshi: 'PROJECT_TYPE', TYPE: 'GET', isShow: false);
    loadUrl(METHOD_SYSDATA + 'CUSTOMER_REGION', null,
        biaoshi: 'CUSTOMER_REGION', TYPE: 'GET', isShow: false);
    loadUrl(METHOD_SYSDATA + 'GENGER', null,
        biaoshi: 'GENGER', TYPE: 'GET', isShow: false);
    loadUrl(METHOD_SYSDATA + 'TASK_TYPE', null,
        biaoshi: 'TASK_TYPE', TYPE: 'GET', isShow: false);
    loadUrl(METHOD_SYSDATA + 'URGENCY_DEEP', null,
        biaoshi: 'URGENCY_DEEP', TYPE: 'GET', isShow: false);
    loadUrl(METHOD_SYSDATA + 'TASK_SHAPE', null,
        biaoshi: 'TASK_SHAPE', TYPE: 'GET', isShow: false);
    loadUrl(METHOD_SYSDATA + 'TASK_SOURCE', null,
        biaoshi: 'TASK_SOURCE', TYPE: 'GET', isShow: false);
    loadUrl(METHOD_GETCUSTOMERS, null, TYPE: 'GET', isShow: false);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("--" + state.toString());
    switch (state) {
      case AppLifecycleState.inactive: // 处于这种状态的应用程序应该假设它们可能在任何时候暂停。
        break;
      case AppLifecycleState.resumed: // 应用程序可见，前台
        print("前台");
        break;
      case AppLifecycleState.paused: // 应用程序不可见，后台
        print("后台");
        break;
//      case AppLifecycleState.suspending: // 申请将暂时暂停
//        break;
      case AppLifecycleState.detached:
        // TODO: Handle this case.
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  disMsg(int what, var data) {
    switch (what) {
      case 0:
        mModelCount = data;
        reLoad();
        break;
      case 1:
        _changeTab(data);
        break;
      case 2:
        xxCount = data;
        reLoad();
        break;
      case 6:
        loadUrl(METHOD_GetAmount, {"app": "1"}, isShow: false);
        break;
      case 222:
//        Help.go2PubView(context, data, "");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _doubleExit,
      child: Scaffold(
          body: IndexedStack(
              index: _tabIndex,
              children: <Widget>[PgWork(), PgFx(), PgXx(), PgWode()]),
          bottomNavigationBar: BottomTabBar(
            items: <BottomTabBarItem>[
              BottomTabBarItem(
                icon: Icon(Icons.work),
                title: Text(appBarTitles[0],
                    style: TextStyle(
                        fontSize: 15,
                        color: _tabIndex == 0 ? Help.mColor : Colors.black45)),
                badge: null,
              ),
              BottomTabBarItem(
                icon: Icon(Icons.widgets),
                title: Text(appBarTitles[1],
                    style: TextStyle(
                        fontSize: 15,
                        color: _tabIndex == 1 ? Help.mColor : Colors.black45)),
                badge: mModelAA != null &&
                        mModelAA.OAAmount + mModelAA.ProjectAmount > 0
                    ? CircleAvatar(
                        radius: ScreenUtil.getScaleW(context, 9),
                        backgroundColor: Colors.red,
                        child: Text(
                          (mModelAA.OAAmount + mModelAA.ProjectAmount) > 99
                              ? '99'
                              : (mModelAA.OAAmount + mModelAA.ProjectAmount)
                                  .toString(),
                          style: Style.minTextWhite,
                        ),
                      )
                    : null,
              ),
              BottomTabBarItem(
                icon: Icon(Icons.chat_bubble),
                title: Text(appBarTitles[2],
                    style: TextStyle(
                        fontSize: 15,
                        color: _tabIndex == 2 ? Help.mColor : Colors.black45)),
                badge: xxCount > 0
                    ? CircleAvatar(
                        radius: ScreenUtil.getScaleW(context, 9),
                        backgroundColor: Colors.red,
                        child: Text(
                          xxCount > 99 ? '99' : xxCount.toString(),
                          style: Style.minTextWhite,
                        ),
                      )
                    : null,
              ),
              BottomTabBarItem(
                icon: Icon(Icons.person),
                title: Text(appBarTitles[3],
                    style: TextStyle(
                        fontSize: 15,
                        color: _tabIndex == 3 ? Help.mColor : Colors.black45)),
                badge: mModelCount != null && mModelCount.Total > 0
                    ? CircleAvatar(
                        radius: ScreenUtil.getScaleW(context, 9),
                        backgroundColor: Colors.red,
                        child: Text(
                          mModelCount.Total > 99
                              ? '99'
                              : mModelCount.Total.toString(),
                          style: Style.minTextWhite,
                        ),
                      )
                    : null,
              ),
            ],
            type: BottomTabBarType.fixed,
            currentIndex: _tabIndex,
            fixedColor: Help.mColor,
            //点击事件
            onTap: (int a) => _changeTab(a),
          )),
    );
  }
}

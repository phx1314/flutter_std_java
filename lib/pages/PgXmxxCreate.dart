import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_std/bean/BeanFrom.dart';
import 'package:flutter_std/item/ItemDetailChoose.dart';
import 'package:flutter_std/item/ItemDetailEditText.dart';
import 'package:flutter_std/item/ItemDetailTitle.dart';
import 'package:flutter_std/item/ItemDialogSub.dart';
import 'package:flutter_std/model/ModelCustomer.dart';
import 'package:flutter_std/model/ModelDetailBean.dart';
import 'package:flutter_std/model/ModelFrom.dart';
import 'package:flutter_std/model/ModelKeys.dart';
import 'package:flutter_std/model/ModelProj.dart';
import 'package:flutter_std/model/ModelProjectInfo.dart';
import 'package:flutter_std/model/ModelSysData.dart';
import 'package:flutter_std/pages/PgFileListEdit.dart';
import 'package:flutter_std/pages/PgGzjd.dart';
import 'package:flutter_std/utils/BaseState.dart';
import 'package:flutter_std/utils/GSYStyle.dart';

import '../Help.dart';
import 'PgFileList.dart';

class PgXmxxCreate extends StatefulWidget {
  String id;

  PgXmxxCreate(this.id);

  @override
  State createState() => new PgXmxxCreateState();
}

class PgXmxxCreateState extends BaseState<PgXmxxCreate> {
  List<ModelDetailBean> list = new List();
  List<String> strs = new List();
  ModelProj mModelProj;
  ModelKeys mModelKeys;
  BeanFrom mBeanFrom = new BeanFrom();
  bool isZC = false;
  ModelProjectInfo mModelProjectInfo;
  List<FilesListBean> files = new List();
  bool isEnable = false;

  @override
  void initView() {
    strs.add('附件列表');
    strs.add('审批流程');
  }

  @override
  void disMsg(int what, data) {
    switch (what) {
      case 300:
        ModelFrom mModelFrom = data;
        if (mModelFrom.action == '提交') {
          if (widget.id == null || widget.id == '') {
            createBeanFromData(false, mModelFrom);
            loadUrl(METHOD_ADD, mBeanFrom.toJson());
          } else {
            createBeanFromData(true, mModelFrom);
            loadUrl(METHOD_PROJECTINFOUPDATE, mBeanFrom.toJson(), TYPE: 'PUT');
            if (!isZC)
              loadUrl(METHOD_COMPLETE, {
                'nextNodeId': mModelFrom.nextNodeId,
                'nextTaskOwnnerId': mModelFrom.nextTaskOwnnerId,
                'remark': mModelFrom.remark,
                'taskId': mModelFrom.taskId
              });
          }
        } else if (mModelFrom.action == '回退') {
          loadUrl(METHOD_BACK, {
            'nextNodeId': mModelFrom.nextNodeId,
            'nextTaskOwnnerId': mModelFrom.nextTaskOwnnerId,
            'remark': mModelFrom.remark,
            'taskId': mModelFrom.taskId
          });
        }
        break;
    }
  }

  void createBeanFromData(bool startFlowIsNULL, ModelFrom mModelFrom) {
    mBeanFrom.projId = widget.id;
    mBeanFrom.projNo = list[0].value;
    mBeanFrom.projName = list[1].value;
    mBeanFrom.projLeaderId = list[2].id;
    mBeanFrom.projTypeId = list[3].id;
    mBeanFrom.projDepId = list[4].id;
    mBeanFrom.projJoinDepIds = list[5].id;
    mBeanFrom.projApproval = list[8].value;
    mBeanFrom.projAreaId = list[9].id;
    mBeanFrom.projPlanStartDate = list[10].value;
    mBeanFrom.projPlanFinishDate = list[11].value;
    mBeanFrom.projNote = list[12].value;
    mBeanFrom.custCompName = list[14].value;
    mBeanFrom.custLinkName = list[15].value;
    mBeanFrom.custLinkSex = list[16].id;
    mBeanFrom.custLinkTel = list[17].value;
    mBeanFrom.custDuty = list[18].value;
    mBeanFrom.custLinkEmail = list[19].value;
    mBeanFrom.selfTaskType = list[21].id;
    mBeanFrom.selfTaskShape = list[22].id;
    mBeanFrom.selfTaskUrgent = list[23].id;
    mBeanFrom.selfTaskGist = list[24].value;
    mBeanFrom.selfTaskGistNo = list[25].value;
    mBeanFrom.selfTaskSource = list[26].id;
    mBeanFrom.selfTaskContent = list[27].value;
    mBeanFrom.selfTaskCapitalSource = list[28].value;
    mBeanFrom.selfTaskLeadDate = list[29].value;
    mBeanFrom.selfTaskLeadContent = list[30].value;
    mBeanFrom.selfTaskOthers = list[31].value;
    mBeanFrom.type = 1;
    mBeanFrom.tenantId = Help.mModelUser.tenantId;
    mBeanFrom.files = files;
    if (startFlowIsNULL && !isZC) {
      mBeanFrom.startFlow = null;
    } else {
      mBeanFrom.startFlow = new StartFlowBean();
      mBeanFrom.startFlow.nextNodeId = mModelFrom.nextNodeId;
      mBeanFrom.startFlow.startNodeId = mModelProj != null
          ? mModelProj.data[0].nodeId
          : mModelKeys.tasks[0].nodeId;
      mBeanFrom.startFlow.nextTaskOwnnerId = mModelFrom.nextTaskOwnnerId;
      mBeanFrom.startFlow.remark = mModelFrom.remark;
      mBeanFrom.startFlow.refTab = 'PROJ_MAIN_PROJECT';
      mBeanFrom.startFlow.isDirectEnd = false;
      mBeanFrom.startFlow.projId = widget.id;
    }
  }

  @override
  void loadData() {
    if (widget.id == null || widget.id == '') {
      //发起
      addView(true);
      strs.add('提交');
      loadUrl(METHOD_PROJ_MAIN_PROJECT, null, TYPE: 'GET');
    } else {
      loadUrlSpecial(METHOD_DETAILBYBUSINESSKEYS, [widget.id]);
    }
  }

  @override
  void onSuccess(String methodName, res) {
    if (methodName == METHOD_DETAILBYBUSINESSKEYS) {
      if (res.data['data'].length == 0) {
        loadUrl(METHOD_PROJ_MAIN_PROJECT, null, TYPE: 'GET');
        strs.add('提交');
        addView(true);
        isZC = true;
      } else {
        mModelKeys = ModelKeys.fromJson(res.data['data'][widget.id]);
        if (mModelKeys.tasks[0].executorId == Help.mModelUser.data.userId) {
          //当前节点处理人判断
          for (int i = 0; i < mModelKeys.flowModel.modelNodes.length; i++) {
            if (mModelKeys.flowModel.modelNodes[i].nodeId ==
                mModelKeys.nodeId) {
              if (i == 0) {
                //第一次
                strs.add('提交');
                addView(true);
              } else {
                strs.add('提交');
                strs.add('回退');
                addView(false);
              }
              break;
            }
          }
        } else {
          addView(false);
        }
      }
    } else if (methodName == METHOD_PROJ_MAIN_PROJECT) {
      mModelProj = ModelProj.fromJson(res.data);
    } else if (methodName == METHOD_COMPLETE ||
        methodName == METHOD_BACK ||
        methodName == METHOD_ADD ||
        (methodName == METHOD_PROJECTINFOUPDATE && isZC)) {
      Help.Toast(context, '处理成功');
      Help.sendMsg('PgFlowList', 0, '');
      finish();
    } else if (methodName == METHOD_PROJECTINFO) {
      mModelProjectInfo = ModelProjectInfo.fromJson(res.data);
      files = mModelProjectInfo.data.files;
      list[0].value = mModelProjectInfo.data.projNo ?? '';
      list[1].value = mModelProjectInfo.data.projName ?? '';
      list[2].value = Help.getNameFormId(
          mModelProjectInfo.data.projLeaderId, Help.mModelUser.BaseEmployee);
      list[2].id = mModelProjectInfo.data.projLeaderId;
      list[3].value = Help.getNameFormId(mModelProjectInfo.data.projTypeId,
          list[3].mModelSysData.queryResult.list);
      list[3].id = mModelProjectInfo.data.projTypeId;
      list[4].value = Help.getNameFormId(mModelProjectInfo.data.projDepId ?? '',
          list[4].mModelSysData.queryResult.list);
      list[4].id = mModelProjectInfo.data.projDepId;
      list[5].value = Help.getNamesFormIds(
          mModelProjectInfo.data.projJoinDepIds ?? '',
          list[5].mModelSysData.queryResult.list);
      list[5].id = mModelProjectInfo.data.projJoinDepIds;
      list[6].value = mModelProjectInfo.data.createEmpName ?? '';
      list[7].value = Help.getRightDate(mModelProjectInfo.data.createDate ?? 0);
      list[8].value =
          Help.getRightDate(mModelProjectInfo.data.projApproval ?? 0);
      list[9].value = Help.getNameFormId(
          mModelProjectInfo.data.projAreaId ?? '',
          list[9].mModelSysData.queryResult.list);
      list[9].id = mModelProjectInfo.data.projAreaId;
      list[10].value =
          Help.getRightDate(mModelProjectInfo.data.projPlanStartDate ?? 0);
      list[11].value =
          Help.getRightDate(mModelProjectInfo.data.projPlanFinishDate ?? 0);
      list[12].value = mModelProjectInfo.data.projNote ?? '';
      list[14].value = mModelProjectInfo.data.custCompName ?? '';
      list[15].value = mModelProjectInfo.data.custLinkName ?? '';
      list[16].value = Help.getNameFormId(
          mModelProjectInfo.data.custLinkSex ?? '',
          list[16].mModelSysData.queryResult.list);
      list[16].id = mModelProjectInfo.data.custLinkSex;
      list[17].value = mModelProjectInfo.data.custLinkTel ?? '';
      list[18].value = mModelProjectInfo.data.custDuty ?? '';
      list[19].value = mModelProjectInfo.data.custLinkEmail ?? '';
      list[21].value = Help.getNameFormId(
          mModelProjectInfo.data.selfTaskType ?? '',
          list[21].mModelSysData.queryResult.list);
      list[21].id = mModelProjectInfo.data.selfTaskType;
      list[22].value = Help.getNameFormId(
          mModelProjectInfo.data.selfTaskShape ?? '',
          list[22].mModelSysData.queryResult.list);
      list[22].id = mModelProjectInfo.data.selfTaskShape;
      list[23].value = Help.getNameFormId(
          mModelProjectInfo.data.selfTaskUrgent ?? '',
          list[23].mModelSysData.queryResult.list);
      list[23].id = mModelProjectInfo.data.selfTaskUrgent;
      list[24].value = mModelProjectInfo.data.selfTaskGist ?? '';
      list[25].value = mModelProjectInfo.data.selfTaskGistNo ?? '';
      list[26].value = Help.getNameFormId(
          mModelProjectInfo.data.selfTaskSource ?? '',
          list[26].mModelSysData.queryResult.list);
      list[26].id = mModelProjectInfo.data.selfTaskSource;
      list[27].value = mModelProjectInfo.data.selfTaskContent ?? '';
      list[28].value = mModelProjectInfo.data.selfTaskCapitalSource ?? '';
      list[29].value =
          Help.getRightDate(mModelProjectInfo.data.selfTaskLeadDate ?? 0);
      list[30].value = mModelProjectInfo.data.selfTaskLeadContent ?? '';
      list[31].value = mModelProjectInfo.data.selfTaskOthers ?? '';
      reLoad();
    }
  }

  List<ModelNodesListBean> createDataSub() {
    if (mModelProj != null) {
      List<ModelNodesListBean> data = getDataFromList(mModelProj.data);
      if (data.length <= 0) {
        data.add(new ModelNodesListBean()..nodeName = '无');
      }
      return data;
    } else {
      List<ModelNodesListBean> data = new List();
      int tag = -1;
      for (int i = 0; i < mModelKeys.flowModel.modelNodes.length; i++) {
        if (mModelKeys.tasks[0].nodeId ==
            mModelKeys.flowModel.modelNodes[i].nodeId) {
          tag = i;
        }
        if (tag != -1 && i >= tag) {
          data.add(mModelKeys.flowModel.modelNodes[i]);
        }
      }
      List<ModelNodesListBean> data_new = getDataFromList(data);
      if (data_new.length <= 0) {
        data_new.add(new ModelNodesListBean()..nodeName = '无');
      }
      return data_new;
    }
  }

  List<ModelNodesListBean> createDataBack() {
    List<ModelNodesListBean> data = new List();
    int tag = -1;
    for (int i = mModelKeys.flowModel.modelNodes.length - 1; i >= 0; i--) {
      if (mModelKeys.tasks[0].nodeId ==
          mModelKeys.flowModel.modelNodes[i].nodeId) {
        tag = i;
      }
      if (tag != -1 && i < tag) {
        data.add(mModelKeys.flowModel.modelNodes[i]);
      }
    }
    return data;
  }

  List<ModelNodesListBean> getDataFromList(List<ModelNodesListBean> data) {
    List<ModelNodesListBean> mModelNodesListBeans = new List();
    if (data.length <= 1) return List();

    if (data[0].nodeCanJump)
      for (int i = 0; i < data.length; i++) {
        if (data[0].nodeJumpId == data[i].nodeId) {
          mModelNodesListBeans.add(data[i]);
          break;
        }
      }
    mModelNodesListBeans.add(data[1]);
    return mModelNodesListBeans;
  }

  void addView(bool allEnable) {
    isEnable = allEnable;
    list.add(new ModelDetailBean('项目编号', 0,
        hint: '请输入项目编号', isMust: true, isEnable: allEnable));
    list.add(new ModelDetailBean('项目名称', 0,
        hint: '请输入项目名称', isMust: true, isEnable: allEnable));
    list.add(new ModelDetailBean('项目负责人', 2,
        hint: '请选择项目负责人', isMust: true, isEnable: allEnable));
    list.add(new ModelDetailBean('项目类型', 4,
        hint: '请选择项目类型', isMust: true, isEnable: allEnable));
    list.add(
        new ModelDetailBean('主办部门', 4, hint: '请选择主办部门', isEnable: allEnable));
    list.add(
        new ModelDetailBean('协办部门', 5, hint: '请选择协办部门', isEnable: allEnable));
    list.add(new ModelDetailBean('登记人', 0,
        hint: '',
        isEnable: false,
        value: Help.mModelUser.data.userName,
        id: Help.mModelUser.data.userId));
    list.add(new ModelDetailBean('登记日期', 0,
        hint: '', isEnable: false, value: Help.getCurrentTime()));
    list.add(
        new ModelDetailBean('立项时间', 1, hint: '请选择立项时间', isEnable: allEnable));
    list.add(new ModelDetailBean('区域', 4, hint: '请选择区域', isEnable: allEnable));
    list.add(
        new ModelDetailBean('计划开始', 1, hint: '请选择计划开始时间', isEnable: allEnable));
    list.add(
        new ModelDetailBean('计划结束', 1, hint: '请选择计划结束时间', isEnable: allEnable));
    list.add(
        new ModelDetailBean('项目备注', 0, hint: '请输入项目备注', isEnable: allEnable));
    list.add(new ModelDetailBean('客户信息', 6, hint: '', isEnable: allEnable));
    list.add(
        new ModelDetailBean('客户单位', 4, hint: '请选择客户单位', isEnable: allEnable));
    list.add(
        new ModelDetailBean('联系人', 0, hint: '请输入联系人', isEnable: allEnable));
    list.add(new ModelDetailBean('性別', 4, hint: '请选择性別', isEnable: allEnable));
    list.add(
        new ModelDetailBean('联系电话', 0, hint: '请输入联系电话', isEnable: allEnable));
    list.add(new ModelDetailBean('职务', 0, hint: '请输入职务', isEnable: allEnable));
    list.add(new ModelDetailBean('邮箱', 0, hint: '请输入邮箱', isEnable: allEnable));
    list.add(new ModelDetailBean('自定义信息', 6, hint: '', isEnable: allEnable));
    list.add(new ModelDetailBean('任务类型', 4,
        hint: '请选择任务类型', isMust: true, isEnable: allEnable));
    list.add(
        new ModelDetailBean('任务形式', 4, hint: '请选择任务形式', isEnable: allEnable));
    list.add(
        new ModelDetailBean('紧急程度', 4, hint: '请选择紧急程度', isEnable: allEnable));
    list.add(
        new ModelDetailBean('任务依据', 0, hint: '请输入任务依据', isEnable: allEnable));
    list.add(
        new ModelDetailBean('任务编号', 0, hint: '请输入任务编号', isEnable: allEnable));
    list.add(
        new ModelDetailBean('任务来源', 4, hint: '请选择任务来源', isEnable: allEnable));
    list.add(
        new ModelDetailBean('任务内容', 0, hint: '请输入任务内容', isEnable: allEnable));
    list.add(
        new ModelDetailBean('资金来源', 0, hint: '请输入资金来源', isEnable: allEnable));
    list.add(
        new ModelDetailBean('交付时间', 1, hint: '请选择交付时间', isEnable: allEnable));
    list.add(
        new ModelDetailBean('交付内容', 0, hint: '请输入交付内容', isEnable: allEnable));
    list.add(new ModelDetailBean('其他', 0, hint: '请输入其他', isEnable: allEnable));
    list[4].mModelSysData = new ModelSysData();
    list[4].mModelSysData.queryResult = new QueryResultBean();
    list[4].mModelSysData.queryResult.list = new List();
    list[5].mModelSysData = new ModelSysData();
    list[5].mModelSysData.queryResult = new QueryResultBean();
    list[5].mModelSysData.queryResult.list = new List();
    Help.mModelUser.mModelEmployee.queryResult.list.forEach((f) {
      ListListBean item = new ListListBean();
      item.itemName = f.name;
      item.itemId = f.id;
      list[4].mModelSysData.queryResult.list.add(item);
      list[5].mModelSysData.queryResult.list.add(item);
    });
    list[3].mModelSysData = Help.mModelSysData_PROJECT_TYPE;
    list[9].mModelSysData = Help.mModelSysData_CUSTOMER_REGION;
    list[16].mModelSysData = Help.mModelSysData_GENGER;
    list[21].mModelSysData = Help.mModelSysData_TASK_TYPE;
    list[23].mModelSysData = Help.mModelSysData_URGENCY_DEEP;
    list[22].mModelSysData = Help.mModelSysData_TASK_SHAPE;
    list[26].mModelSysData = Help.mModelSysData_TASK_SOURCE;
    list[14].mModelSysData = new ModelSysData();
    list[14].mModelSysData.queryResult = new QueryResultBean();
    list[14].mModelSysData.queryResult.list = new List();
    Help.mModelSysData_METHOD_GETCUSTOMERS.data.forEach((f) {
      ListListBean item = new ListListBean();
      item.itemName = f.name;
      item.itemId = f.tenantId;
      list[14].mModelSysData.queryResult.list.add(item);
    });
    if (widget.id != null && widget.id != '') {
      loadUrl(METHOD_PROJECTINFO + widget.id, null,
          biaoshi: METHOD_PROJECTINFO, TYPE: 'GET');
    }
    reLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('项目信息登记'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_vert,
                size: ScreenUtil.getScaleW(context, 25),
              ),
              onPressed: () {
                if (strs.length > 0)
                  Help.showPop(
                    context,
                    strs,
                    (v) {
                      if (v == '提交') {
                        for (int i = 0; i < list.length; i++) {
                          if (list[i].isMust == true &&
                              (list[i].value == null || list[i].value == '')) {
                            Help.Toast(context, list[i].hint);
                            return;
                          }
                        }
                        Help.showMyDialog(
                            context,
                            ItemDialogSub(
                                widget.toString(),
                                v,
                                createDataSub(),
                                mModelProj != null
                                    ? ''
                                    : mModelKeys.tasks[0].taskId));
                      } else if (v == '回退') {
                        Help.showMyDialog(
                            context,
                            ItemDialogSub(
                                widget.toString(),
                                v,
                                createDataBack(),
                                mModelProj != null
                                    ? ''
                                    : mModelKeys.tasks[0].taskId));
                      } else if (v == '附件列表') {
                        if (isEnable) {
                          Help.goWhere(context, PgFileListEdit(files));
                        } else {
                          Help.goWhere(
                              context,
                              PgFileList(mModelProjectInfo == null
                                  ? null
                                  : mModelProjectInfo.data.files));
                        }
                      } else if (v == '审批流程') {
                        Help.goWhere(context, PgGzjd(widget.id));
                      }
                    },
                    left: 1,
                  );
              },
            ),
          ],
        ),
        body: ListView.separated(
          itemCount: list.length,
          separatorBuilder: (context, index) => Divider(
                height: 1,
              ),
          // 添加分割线
          itemBuilder: (context, index) {
            try {
              if (list[index].type == 0) {
                return ItemDetailEditText(list[index]);
              } else if (list[index].type == 6) {
                return ItemDetailTitle(list[index].title);
              } else {
                return ItemDetailChoose(list[index]);
              }
            } catch (e) {
              return Container();
            }
          },
        ));
  }
}

import 'package:flutter_std/model/ModelProjectInfo.dart';

class BeanFrom {
  String custCompId;
  String custCompName;
  String custDuty;
  String custLinkEmail;
  String custLinkId;
  String custLinkName;
  String custLinkSex;
  String custLinkTel;
  String projApproval;
  String projId;
  String projAreaId;
  String projDepId;
  String projJoinDepIds;
  String projLeaderDepId;
  String projLeaderId;
  String projName;
  String projNo;
  String projNote;
  String projPlanFinishDate;
  String projPlanStartDate;
  String projRegister;
  String projRegisterDate;
  String projTypeId;
  String selfTaskCapitalSource;
  String selfTaskContent;
  String selfTaskGist;
  String selfTaskGistNo;
  String selfTaskLeadContent;
  String selfTaskLeadDate;
  String selfTaskOthers;
  String selfTaskShape;
  String selfTaskSource;
  String selfTaskType;
  String selfTaskUrgent;
  String tenantId;
  int type;
  StartFlowBean startFlow;
  List<FilesListBean> files;

  BeanFrom(
      {this.custCompId,
      this.custCompName,
      this.custDuty,
      this.custLinkEmail,
      this.custLinkId,
      this.custLinkName,
      this.custLinkSex,
      this.custLinkTel,
      this.projApproval,
      this.projId,
      this.projAreaId,
      this.projDepId,
      this.projJoinDepIds,
      this.projLeaderDepId,
      this.projLeaderId,
      this.projName,
      this.projNo,
      this.projNote,
      this.projPlanFinishDate,
      this.projPlanStartDate,
      this.projRegister,
      this.projRegisterDate,
      this.projTypeId,
      this.selfTaskCapitalSource,
      this.selfTaskContent,
      this.selfTaskGist,
      this.selfTaskGistNo,
      this.selfTaskLeadContent,
      this.selfTaskLeadDate,
      this.selfTaskOthers,
      this.selfTaskShape,
      this.selfTaskSource,
      this.selfTaskType,
      this.selfTaskUrgent,
      this.tenantId,
      this.type,
      this.files,
      this.startFlow});

  BeanFrom.fromJson(Map<String, dynamic> json) { this.files = (json['files'] as List)!=null?(json['files'] as List).map((i) => FilesListBean.fromJson(i)).toList():null;
    this.custCompId = json['custCompId'];
    this.custCompName = json['custCompName'];
    this.custDuty = json['custDuty'];
    this.custLinkEmail = json['custLinkEmail'];
    this.custLinkId = json['custLinkId'];
    this.custLinkName = json['custLinkName'];
    this.custLinkSex = json['custLinkSex'];
    this.custLinkTel = json['custLinkTel'];
    this.projApproval = json['projApproval'];
    this.projId = json['projId'];
    this.projAreaId = json['projAreaId'];
    this.projDepId = json['projDepId'];
    this.projJoinDepIds = json['projJoinDepIds'];
    this.projLeaderDepId = json['projLeaderDepId'];
    this.projLeaderId = json['projLeaderId'];
    this.projName = json['projName'];
    this.projNo = json['projNo'];
    this.projNote = json['projNote'];
    this.projPlanFinishDate = json['projPlanFinishDate'];
    this.projPlanStartDate = json['projPlanStartDate'];
    this.projRegister = json['projRegister'];
    this.projRegisterDate = json['projRegisterDate'];
    this.projTypeId = json['projTypeId'];
    this.selfTaskCapitalSource = json['selfTaskCapitalSource'];
    this.selfTaskContent = json['selfTaskContent'];
    this.selfTaskGist = json['selfTaskGist'];
    this.selfTaskGistNo = json['selfTaskGistNo'];
    this.selfTaskLeadContent = json['selfTaskLeadContent'];
    this.selfTaskLeadDate = json['selfTaskLeadDate'];
    this.selfTaskOthers = json['selfTaskOthers'];
    this.selfTaskShape = json['selfTaskShape'];
    this.selfTaskSource = json['selfTaskSource'];
    this.selfTaskType = json['selfTaskType'];
    this.selfTaskUrgent = json['selfTaskUrgent'];
    this.tenantId = json['tenantId'];
    this.type = json['type'];
    this.startFlow = json['startFlow'] != null
        ? StartFlowBean.fromJson(json['startFlow'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['custCompId'] = this.custCompId;
    data['custCompName'] = this.custCompName;
    data['custDuty'] = this.custDuty;
    data['custLinkEmail'] = this.custLinkEmail;
    data['custLinkId'] = this.custLinkId;
    data['custLinkName'] = this.custLinkName;
    data['custLinkSex'] = this.custLinkSex;
    data['custLinkTel'] = this.custLinkTel;
    data['projApproval'] = this.projApproval;
    data['projId'] = this.projId;
    data['projAreaId'] = this.projAreaId;
    data['projDepId'] = this.projDepId;
    data['projJoinDepIds'] = this.projJoinDepIds;
    data['projLeaderDepId'] = this.projLeaderDepId;
    data['projLeaderId'] = this.projLeaderId;
    data['projName'] = this.projName;
    data['projNo'] = this.projNo;
    data['projNote'] = this.projNote;
    data['projPlanFinishDate'] = this.projPlanFinishDate;
    data['projPlanStartDate'] = this.projPlanStartDate;
    data['projRegister'] = this.projRegister;
    data['projRegisterDate'] = this.projRegisterDate;
    data['projTypeId'] = this.projTypeId;
    data['selfTaskCapitalSource'] = this.selfTaskCapitalSource;
    data['selfTaskContent'] = this.selfTaskContent;
    data['selfTaskGist'] = this.selfTaskGist;
    data['selfTaskGistNo'] = this.selfTaskGistNo;
    data['selfTaskLeadContent'] = this.selfTaskLeadContent;
    data['selfTaskLeadDate'] = this.selfTaskLeadDate;
    data['selfTaskOthers'] = this.selfTaskOthers;
    data['selfTaskShape'] = this.selfTaskShape;
    data['selfTaskSource'] = this.selfTaskSource;
    data['selfTaskType'] = this.selfTaskType;
    data['selfTaskUrgent'] = this.selfTaskUrgent;
    data['tenantId'] = this.tenantId;
    data['type'] = this.type; data['files'] = this.files != null?this.files.map((i) => i.toJson()).toList():null;
    if (this.startFlow != null) {
      data['startFlow'] = this.startFlow.toJson();
    } else {
      data['startFlow'] = null;
    }
    return data;
  }
}

class StartFlowBean {
  String businessKey;
  String nextNodeId;
  String nextTaskOwnnerId;
  String projId;
  String refTab;
  String remark;
  String stageId;
  String startNodeId;
  bool isDirectEnd;

  StartFlowBean(
      {this.businessKey,
      this.nextNodeId,
      this.nextTaskOwnnerId,
      this.projId,
      this.refTab,
      this.remark,
      this.stageId,
      this.startNodeId,
      this.isDirectEnd});

  StartFlowBean.fromJson(Map<String, dynamic> json) {
    this.businessKey = json['businessKey'];
    this.nextNodeId = json['nextNodeId'];
    this.nextTaskOwnnerId = json['nextTaskOwnnerId'];
    this.projId = json['projId'];
    this.refTab = json['refTab'];
    this.remark = json['remark'];
    this.stageId = json['stageId'];
    this.startNodeId = json['startNodeId'];
    this.isDirectEnd = json['isDirectEnd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['businessKey'] = this.businessKey;
    data['nextNodeId'] = this.nextNodeId;
    data['nextTaskOwnnerId'] = this.nextTaskOwnnerId;
    data['projId'] = this.projId;
    data['refTab'] = this.refTab;
    data['remark'] = this.remark;
    data['stageId'] = this.stageId;
    data['startNodeId'] = this.startNodeId;
    data['isDirectEnd'] = this.isDirectEnd;
    return data;
  }
}

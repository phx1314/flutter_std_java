class ModelFlowList {
  String message;
  bool success;
  int code;
  QueryResultBean queryResult;

  ModelFlowList({this.message, this.success, this.code, this.queryResult});

  ModelFlowList.fromJson(Map<String, dynamic> json) {    
    this.message = json['message'];
    this.success = json['success'];
    this.code = json['code'];
    this.queryResult = json['queryResult'] != null ? QueryResultBean.fromJson(json['queryResult']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    data['code'] = this.code;
    if (this.queryResult != null) {
      data['queryResult'] = this.queryResult.toJson();
    }
    return data;
  }

}

class QueryResultBean {
  int total;
  List<ListListBean> list;

  QueryResultBean({this.total, this.list});

  QueryResultBean.fromJson(Map<String, dynamic> json) {    
    this.total = json['total'];
    this.list = (json['list'] as List)!=null?(json['list'] as List).map((i) => ListListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['list'] = this.list != null?this.list.map((i) => i.toJson()).toList():null;
    return data;
  }
}

class ListListBean {
  String tenantId;
  String createEmpId;
  String createEmpName;
  String createDeptId;
  String createDeptName;
  String modifyEmpId;
  String modifyEmpName;
  String deleteDate;
  String deleteEmpId;
  String deleteEmpName;
  String projId;
  String projNo;
  String itemName;
  String mainProjName;
  String projName;
  String projLeaderId;
  String projLeaderDepId;
  String projTypeId;
  String projDepId;
  String projRegister;
  String projAreaId;
  String projNote;
  String projArchTempId;
  String projArchTempPreId;
  String custCompName;
  String custCompId;
  String custLinkId;
  String custLinkName;
  String custLinkSex;
  String custLinkTel;
  String custLinkEmail;
  String custDuty;
  String selfTaskType;
  String selfTaskShape;
  String selfTaskUrgent;
  String selfTaskGist;
  String selfTaskGistNo;
  String selfTaskSource;
  String selfTaskContent;
  String selfTaskCapitalSource;
  String selfTaskLeadContent;
  String selfTaskOthers;
  String projAffix;
  String projJoinDepIds;
  String parentId;
  String voltageLevel;
  String projLeaderName;
  String projTypeName;
  String stageList;
  String stageId;
  String stageName;
  String leaderName;
  String planStartTime;
  String planEndTime;
  String planStartDate;
  String planEndDate;
  String stateDesc;
  String realName;
  String projCount;
  String startFlow;
  String flowStatus;
  String status;
  String son;
  bool deleteMark;
  bool hasSubProj;
  int type;
  num createDate;
  num modifyDate;
  num projRegisterDate;
  num projApproval;
  num projPlanStartDate;
  num projPlanFinishDate;
  num selfTaskLeadDate;

  ListListBean({this.tenantId, this.createEmpId, this.createEmpName, this.createDeptId, this.createDeptName, this.modifyEmpId, this.modifyEmpName, this.deleteDate, this.deleteEmpId, this.deleteEmpName, this.projId, this.projNo, this.itemName, this.mainProjName, this.projName, this.projLeaderId, this.projLeaderDepId, this.projTypeId, this.projDepId, this.projRegister, this.projAreaId, this.projNote, this.projArchTempId, this.projArchTempPreId, this.custCompName, this.custCompId, this.custLinkId, this.custLinkName, this.custLinkSex, this.custLinkTel, this.custLinkEmail, this.custDuty, this.selfTaskType, this.selfTaskShape, this.selfTaskUrgent, this.selfTaskGist, this.selfTaskGistNo, this.selfTaskSource, this.selfTaskContent, this.selfTaskCapitalSource, this.selfTaskLeadContent, this.selfTaskOthers, this.projAffix, this.projJoinDepIds, this.parentId, this.voltageLevel, this.projLeaderName, this.projTypeName, this.stageList, this.stageId, this.stageName, this.leaderName, this.planStartTime, this.planEndTime, this.planStartDate, this.planEndDate, this.realName, this.projCount, this.startFlow, this.flowStatus, this.status, this.son, this.deleteMark, this.hasSubProj, this.type, this.createDate, this.modifyDate, this.projRegisterDate, this.projApproval, this.projPlanStartDate, this.projPlanFinishDate, this.selfTaskLeadDate});

  ListListBean.fromJson(Map<String, dynamic> json) {    
    this.tenantId = json['tenantId'];
    this.createEmpId = json['createEmpId'];
    this.createEmpName = json['createEmpName'];
    this.createDeptId = json['createDeptId'];
    this.createDeptName = json['createDeptName'];
    this.modifyEmpId = json['modifyEmpId'];
    this.modifyEmpName = json['modifyEmpName'];
    this.deleteDate = json['deleteDate'];
    this.deleteEmpId = json['deleteEmpId'];
    this.deleteEmpName = json['deleteEmpName'];
    this.projId = json['projId'];
    this.projNo = json['projNo'];
    this.itemName = json['itemName'];
    this.mainProjName = json['mainProjName'];
    this.projName = json['projName'];
    this.projLeaderId = json['projLeaderId'];
    this.projLeaderDepId = json['projLeaderDepId'];
    this.projTypeId = json['projTypeId'];
    this.projDepId = json['projDepId'];
    this.projRegister = json['projRegister'];
    this.projAreaId = json['projAreaId'];
    this.projNote = json['projNote'];
    this.projArchTempId = json['projArchTempId'];
    this.projArchTempPreId = json['projArchTempPreId'];
    this.custCompName = json['custCompName'];
    this.custCompId = json['custCompId'];
    this.custLinkId = json['custLinkId'];
    this.custLinkName = json['custLinkName'];
    this.custLinkSex = json['custLinkSex'];
    this.custLinkTel = json['custLinkTel'];
    this.custLinkEmail = json['custLinkEmail'];
    this.custDuty = json['custDuty'];
    this.selfTaskType = json['selfTaskType'];
    this.selfTaskShape = json['selfTaskShape'];
    this.selfTaskUrgent = json['selfTaskUrgent'];
    this.selfTaskGist = json['selfTaskGist'];
    this.selfTaskGistNo = json['selfTaskGistNo'];
    this.selfTaskSource = json['selfTaskSource'];
    this.selfTaskContent = json['selfTaskContent'];
    this.selfTaskCapitalSource = json['selfTaskCapitalSource'];
    this.selfTaskLeadContent = json['selfTaskLeadContent'];
    this.selfTaskOthers = json['selfTaskOthers'];
    this.projAffix = json['projAffix'];
    this.projJoinDepIds = json['projJoinDepIds'];
    this.parentId = json['parentId'];
    this.voltageLevel = json['voltageLevel'];
    this.projLeaderName = json['projLeaderName'];
    this.projTypeName = json['projTypeName'];
    this.stageList = json['stageList'];
    this.stageId = json['stageId'];
    this.stageName = json['stageName'];
    this.leaderName = json['leaderName'];
    this.planStartTime = json['planStartTime'];
    this.planEndTime = json['planEndTime'];
    this.planStartDate = json['planStartDate'];
    this.planEndDate = json['planEndDate'];
    this.realName = json['realName'];
    this.projCount = json['projCount'];
    this.startFlow = json['startFlow'];
    this.flowStatus = json['flowStatus'];
    this.status = json['status'];
    this.son = json['son'];
    this.deleteMark = json['deleteMark'];
    this.hasSubProj = json['hasSubProj'];
    this.type = json['type'];
    this.createDate = json['createDate'];
    this.modifyDate = json['modifyDate'];
    this.projRegisterDate = json['projRegisterDate'];
    this.projApproval = json['projApproval'];
    this.projPlanStartDate = json['projPlanStartDate'];
    this.projPlanFinishDate = json['projPlanFinishDate'];
    this.selfTaskLeadDate = json['selfTaskLeadDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenantId'] = this.tenantId;
    data['createEmpId'] = this.createEmpId;
    data['createEmpName'] = this.createEmpName;
    data['createDeptId'] = this.createDeptId;
    data['createDeptName'] = this.createDeptName;
    data['modifyEmpId'] = this.modifyEmpId;
    data['modifyEmpName'] = this.modifyEmpName;
    data['deleteDate'] = this.deleteDate;
    data['deleteEmpId'] = this.deleteEmpId;
    data['deleteEmpName'] = this.deleteEmpName;
    data['projId'] = this.projId;
    data['projNo'] = this.projNo;
    data['itemName'] = this.itemName;
    data['mainProjName'] = this.mainProjName;
    data['projName'] = this.projName;
    data['projLeaderId'] = this.projLeaderId;
    data['projLeaderDepId'] = this.projLeaderDepId;
    data['projTypeId'] = this.projTypeId;
    data['projDepId'] = this.projDepId;
    data['projRegister'] = this.projRegister;
    data['projAreaId'] = this.projAreaId;
    data['projNote'] = this.projNote;
    data['projArchTempId'] = this.projArchTempId;
    data['projArchTempPreId'] = this.projArchTempPreId;
    data['custCompName'] = this.custCompName;
    data['custCompId'] = this.custCompId;
    data['custLinkId'] = this.custLinkId;
    data['custLinkName'] = this.custLinkName;
    data['custLinkSex'] = this.custLinkSex;
    data['custLinkTel'] = this.custLinkTel;
    data['custLinkEmail'] = this.custLinkEmail;
    data['custDuty'] = this.custDuty;
    data['selfTaskType'] = this.selfTaskType;
    data['selfTaskShape'] = this.selfTaskShape;
    data['selfTaskUrgent'] = this.selfTaskUrgent;
    data['selfTaskGist'] = this.selfTaskGist;
    data['selfTaskGistNo'] = this.selfTaskGistNo;
    data['selfTaskSource'] = this.selfTaskSource;
    data['selfTaskContent'] = this.selfTaskContent;
    data['selfTaskCapitalSource'] = this.selfTaskCapitalSource;
    data['selfTaskLeadContent'] = this.selfTaskLeadContent;
    data['selfTaskOthers'] = this.selfTaskOthers;
    data['projAffix'] = this.projAffix;
    data['projJoinDepIds'] = this.projJoinDepIds;
    data['parentId'] = this.parentId;
    data['voltageLevel'] = this.voltageLevel;
    data['projLeaderName'] = this.projLeaderName;
    data['projTypeName'] = this.projTypeName;
    data['stageList'] = this.stageList;
    data['stageId'] = this.stageId;
    data['stageName'] = this.stageName;
    data['leaderName'] = this.leaderName;
    data['planStartTime'] = this.planStartTime;
    data['planEndTime'] = this.planEndTime;
    data['planStartDate'] = this.planStartDate;
    data['planEndDate'] = this.planEndDate;
    data['realName'] = this.realName;
    data['projCount'] = this.projCount;
    data['startFlow'] = this.startFlow;
    data['flowStatus'] = this.flowStatus;
    data['status'] = this.status;
    data['son'] = this.son;
    data['deleteMark'] = this.deleteMark;
    data['hasSubProj'] = this.hasSubProj;
    data['type'] = this.type;
    data['createDate'] = this.createDate;
    data['modifyDate'] = this.modifyDate;
    data['projRegisterDate'] = this.projRegisterDate;
    data['projApproval'] = this.projApproval;
    data['projPlanStartDate'] = this.projPlanStartDate;
    data['projPlanFinishDate'] = this.projPlanFinishDate;
    data['selfTaskLeadDate'] = this.selfTaskLeadDate;
    return data;
  }
}

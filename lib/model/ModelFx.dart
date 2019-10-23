class ModelFx {
  String message;
  bool success;
  int code;
  QueryResultBean queryResult;

  ModelFx({this.message, this.success, this.code, this.queryResult});

  ModelFx.fromJson(Map<String, dynamic> json) {    
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
  String bussinessKey;
  String proposer;
  String applicationFlow;
  String applicationContent;
  String taskId;
  String taskTurnDate;
  String taskExecutor;
  String taskTitle;
  String taskCompleteDate;
  String taskState;
  String instanceId;
  String instanceCompleteDate;
  String instanceState;
  String stageId;
  String projId;
  String projName;
  String projNo;
  num applicationDate;

  ListListBean({this.bussinessKey, this.proposer, this.applicationFlow, this.applicationContent, this.taskId, this.taskTurnDate, this.taskExecutor, this.taskTitle, this.taskCompleteDate, this.taskState, this.instanceId, this.instanceCompleteDate, this.instanceState, this.stageId, this.projId, this.projName, this.projNo, this.applicationDate});

  ListListBean.fromJson(Map<String, dynamic> json) {    
    this.bussinessKey = json['bussinessKey'];
    this.proposer = json['proposer'];
    this.applicationFlow = json['applicationFlow'];
    this.applicationContent = json['applicationContent'];
    this.taskId = json['taskId'];
    this.taskTurnDate = json['taskTurnDate'];
    this.taskExecutor = json['taskExecutor'];
    this.taskTitle = json['taskTitle'];
    this.taskCompleteDate = json['taskCompleteDate'];
    this.taskState = json['taskState'];
    this.instanceId = json['instanceId'];
    this.instanceCompleteDate = json['instanceCompleteDate'];
    this.instanceState = json['instanceState'];
    this.stageId = json['stageId'];
    this.projId = json['projId'];
    this.projName = json['projName'];
    this.projNo = json['projNo'];
    this.applicationDate = json['applicationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bussinessKey'] = this.bussinessKey;
    data['proposer'] = this.proposer;
    data['applicationFlow'] = this.applicationFlow;
    data['applicationContent'] = this.applicationContent;
    data['taskId'] = this.taskId;
    data['taskTurnDate'] = this.taskTurnDate;
    data['taskExecutor'] = this.taskExecutor;
    data['taskTitle'] = this.taskTitle;
    data['taskCompleteDate'] = this.taskCompleteDate;
    data['taskState'] = this.taskState;
    data['instanceId'] = this.instanceId;
    data['instanceCompleteDate'] = this.instanceCompleteDate;
    data['instanceState'] = this.instanceState;
    data['stageId'] = this.stageId;
    data['projId'] = this.projId;
    data['projName'] = this.projName;
    data['projNo'] = this.projNo;
    data['applicationDate'] = this.applicationDate;
    return data;
  }
}

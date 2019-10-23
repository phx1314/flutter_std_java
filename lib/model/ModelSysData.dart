class ModelSysData {
  String message;
  bool success;
  int code;
  QueryResultBean queryResult;

  ModelSysData({this.message, this.success, this.code, this.queryResult});

  ModelSysData.fromJson(Map<String, dynamic> json) {
    this.message = json['message'];
    this.success = json['success'];
    this.code = json['code'];
    this.queryResult = json['queryResult'] != null
        ? QueryResultBean.fromJson(json['queryResult'])
        : null;
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
    this.list = (json['list'] as List) != null
        ? (json['list'] as List).map((i) => ListListBean.fromJson(i)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['list'] =
        this.list != null ? this.list.map((i) => i.toJson()).toList() : null;
    return data;
  }
}

class ListListBean {
  String tenantId;
  String createDate;
  String createEmpId;
  String createEmpName;
  String createDeptId;
  String createDeptName;
  String modifyDate;
  String modifyEmpId;
  String modifyEmpName;
  String deleteDate;
  String deleteEmpId;
  String deleteEmpName;
  String itemId;
  String dataId;
  String parentId;
  String itemName;
  String itemCode;
  String itemAtt1;
  String itemAtt2;
  String itemAtt3;
  String itemAtt4;
  String itemAtt5;
  String isFixed;
  String isDefault;
  String isShow;
  String isEnabled;
  bool deleteMark;
  int sortCode;
  bool isChecked;

  ListListBean(
      {this.tenantId,
      this.createDate,
      this.createEmpId,
      this.createEmpName,
      this.createDeptId,
      this.createDeptName,
      this.modifyDate,
      this.modifyEmpId,
      this.modifyEmpName,
      this.deleteDate,
      this.deleteEmpId,
      this.deleteEmpName,
      this.itemId,
      this.dataId,
      this.parentId,
      this.itemName,
      this.itemCode,
      this.itemAtt1,
      this.itemAtt2,
      this.itemAtt3,
      this.itemAtt4,
      this.itemAtt5,
      this.isFixed,
      this.isDefault,
      this.isShow,
      this.isEnabled,
      this.deleteMark,
      this.sortCode});

  ListListBean.fromJson(Map<String, dynamic> json) {
    this.tenantId = json['tenantId'];
    this.createDate = json['createDate'];
    this.createEmpId = json['createEmpId'];
    this.createEmpName = json['createEmpName'];
    this.createDeptId = json['createDeptId'];
    this.createDeptName = json['createDeptName'];
    this.modifyDate = json['modifyDate'];
    this.modifyEmpId = json['modifyEmpId'];
    this.modifyEmpName = json['modifyEmpName'];
    this.deleteDate = json['deleteDate'];
    this.deleteEmpId = json['deleteEmpId'];
    this.deleteEmpName = json['deleteEmpName'];
    this.itemId = json['itemId'];
    this.dataId = json['dataId'];
    this.parentId = json['parentId'];
    this.itemName = json['itemName'];
    this.itemCode = json['itemCode'];
    this.itemAtt1 = json['itemAtt1'];
    this.itemAtt2 = json['itemAtt2'];
    this.itemAtt3 = json['itemAtt3'];
    this.itemAtt4 = json['itemAtt4'];
    this.itemAtt5 = json['itemAtt5'];
    this.isFixed = json['isFixed'];
    this.isDefault = json['isDefault'];
    this.isShow = json['isShow'];
    this.isEnabled = json['isEnabled'];
    this.deleteMark = json['deleteMark'];
    this.sortCode = json['sortCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenantId'] = this.tenantId;
    data['createDate'] = this.createDate;
    data['createEmpId'] = this.createEmpId;
    data['createEmpName'] = this.createEmpName;
    data['createDeptId'] = this.createDeptId;
    data['createDeptName'] = this.createDeptName;
    data['modifyDate'] = this.modifyDate;
    data['modifyEmpId'] = this.modifyEmpId;
    data['modifyEmpName'] = this.modifyEmpName;
    data['deleteDate'] = this.deleteDate;
    data['deleteEmpId'] = this.deleteEmpId;
    data['deleteEmpName'] = this.deleteEmpName;
    data['itemId'] = this.itemId;
    data['dataId'] = this.dataId;
    data['parentId'] = this.parentId;
    data['itemName'] = this.itemName;
    data['itemCode'] = this.itemCode;
    data['itemAtt1'] = this.itemAtt1;
    data['itemAtt2'] = this.itemAtt2;
    data['itemAtt3'] = this.itemAtt3;
    data['itemAtt4'] = this.itemAtt4;
    data['itemAtt5'] = this.itemAtt5;
    data['isFixed'] = this.isFixed;
    data['isDefault'] = this.isDefault;
    data['isShow'] = this.isShow;
    data['isEnabled'] = this.isEnabled;
    data['deleteMark'] = this.deleteMark;
    data['sortCode'] = this.sortCode;
    return data;
  }
}

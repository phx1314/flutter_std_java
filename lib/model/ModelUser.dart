import 'package:flutter_std/az/az_common.dart';

import 'ModelEmployee.dart';

class ModelUser {
  String message;
  bool success;
  int code;
  DataBean data;
  String name;
  String password;
  String tenantId;
  List<BaseEmployeeListBean> BaseEmployee;
  ModelEmployee mModelEmployee;

  ModelUser({this.message, this.success, this.code, this.data});

  ModelUser.fromJson(Map<String, dynamic> json) {
    this.message = json['message'];
    this.success = json['success'];
    this.code = json['code'];
    this.name = json['name'];
    this.password = json['password'];
    this.tenantId = json['tenantId'];
    this.mModelEmployee = json['mModelEmployee'] != null
        ? ModelEmployee.fromJson(json['mModelEmployee'])
        : null;
    this.BaseEmployee = (json['BaseEmployee'] as List) != null
        ? (json['BaseEmployee'] as List)
            .map((i) => BaseEmployeeListBean.fromJson(i))
            .toList()
        : null;
    this.data = DataBean.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    data['code'] = this.code;
    data['name'] = this.name;
    data['password'] = this.password;
    data['tenantId'] = this.tenantId;
    data['data'] = this.data.toJson();
    data['mModelEmployee'] = this.mModelEmployee.toJson();
    data['BaseEmployee'] = this.BaseEmployee != null
        ? this.BaseEmployee.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class DataBean {
  String tenantId;
  String tokenId;
  String userId;
  String userName;
  String realName;
  String deptId;
  String deptName;
  String roleIds;
  String token;
  String device;
  String ip;
  String agentUserId;
  String agentUserName;
  num createDate;
  num activeTime;

  DataBean(
      {this.tenantId,
      this.tokenId,
      this.userId,
      this.userName,
      this.realName,
      this.deptId,
      this.deptName,
      this.roleIds,
      this.token,
      this.device,
      this.ip,
      this.agentUserId,
      this.agentUserName,
      this.createDate,
      this.activeTime});

  DataBean.fromJson(Map<String, dynamic> json) {
    this.tenantId = json['tenantId'];
    this.tokenId = json['tokenId'];
    this.userId = json['userId'];
    this.userName = json['userName'];
    this.realName = json['realName'];
    this.deptId = json['deptId'];
    this.deptName = json['deptName'];
    this.roleIds = json['roleIds'];
    this.token = json['token'];
    this.device = json['device'];
    this.ip = json['ip'];
    this.agentUserId = json['agentUserId'];
    this.agentUserName = json['agentUserName'];
    this.createDate = json['createDate'];
    this.activeTime = json['activeTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenantId'] = this.tenantId;
    data['tokenId'] = this.tokenId;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['realName'] = this.realName;
    data['deptId'] = this.deptId;
    data['deptName'] = this.deptName;
    data['roleIds'] = this.roleIds;
    data['token'] = this.token;
    data['device'] = this.device;
    data['ip'] = this.ip;
    data['agentUserId'] = this.agentUserId;
    data['agentUserName'] = this.agentUserName;
    data['createDate'] = this.createDate;
    data['activeTime'] = this.activeTime;
    return data;
  }
}

class BaseEmployeeListBean extends ISuspensionBean {
  String EmpName;
  String EmpDepName;
  String EmpID;
  String EmpDepID;
  String tagIndex;
  bool isChecked;

  BaseEmployeeListBean(
      {this.EmpName, this.EmpDepName, this.EmpID, this.EmpDepID});

  BaseEmployeeListBean.fromJson(Map<String, dynamic> json) {
    this.EmpName = json['EmpName'];
    this.EmpDepName = json['EmpDepName'];
    this.EmpID = json['EmpID'];
    this.EmpDepID = json['EmpDepID'];
    this.isChecked = json['isChecked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmpName'] = this.EmpName;
    data['EmpDepName'] = this.EmpDepName;
    data['EmpID'] = this.EmpID;
    data['EmpDepID'] = this.EmpDepID;
    data['isChecked'] = this.isChecked;
    return data;
  }

  @override
  String getSuspensionTag() {
    return tagIndex;
  }
}

class ModelNodeUser {
  String message;
  bool success;
  int code;
  List<DataListBean> data;

  ModelNodeUser({this.message, this.success, this.code, this.data});

  ModelNodeUser.fromJson(Map<String, dynamic> json) {    
    this.message = json['message'];
    this.success = json['success'];
    this.code = json['code'];
    this.data = (json['data'] as List)!=null?(json['data'] as List).map((i) => DataListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    data['code'] = this.code;
    data['data'] = this.data != null?this.data.map((i) => i.toJson()).toList():null;
    return data;
  }

}

class DataListBean {
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
  String deleteMark;
  String userId;
  String accountTerm;
  String userType;
  String identityNumber;
  String userName;
  String realName;
  String password;
  String designDriveLetter;
  String ipAddress;
  String birthDate;
  String hostName;
  String userTitle;
  String phone;
  String macAddress;
  String departmentId;
  String sortCode;
  String theme;
  String state;
  String memo;
  String isBinding;
  String insideLineNumber;
  String outsideLineNumber;
  String roomNumber;
  String headPortrait;
  String signature;
  String oaEmail;
  String companyEmail;
  String specId;
  String specName;
  String roleId;
  String headFile;
  String signatureFile;
  String teamId;

  DataListBean({this.tenantId, this.createDate, this.createEmpId, this.createEmpName, this.createDeptId, this.createDeptName, this.modifyDate, this.modifyEmpId, this.modifyEmpName, this.deleteDate, this.deleteEmpId, this.deleteEmpName, this.deleteMark, this.userId, this.accountTerm, this.userType, this.identityNumber, this.userName, this.realName, this.password, this.designDriveLetter, this.ipAddress, this.birthDate, this.hostName, this.userTitle, this.phone, this.macAddress, this.departmentId, this.sortCode, this.theme, this.state, this.memo, this.isBinding, this.insideLineNumber, this.outsideLineNumber, this.roomNumber, this.headPortrait, this.signature, this.oaEmail, this.companyEmail, this.specId, this.specName, this.roleId, this.headFile, this.signatureFile, this.teamId});

  DataListBean.fromJson(Map<String, dynamic> json) {    
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
    this.deleteMark = json['deleteMark'];
    this.userId = json['userId'];
    this.accountTerm = json['accountTerm'];
    this.userType = json['userType'];
    this.identityNumber = json['identityNumber'];
    this.userName = json['userName']??json['realName'];
    this.realName = json['realName'];
    this.password = json['password'];
    this.designDriveLetter = json['designDriveLetter'];
    this.ipAddress = json['ipAddress'];
    this.birthDate = json['birthDate'];
    this.hostName = json['hostName'];
    this.userTitle = json['userTitle'];
    this.phone = json['phone'];
    this.macAddress = json['macAddress'];
    this.departmentId = json['departmentId'];
    this.sortCode = json['sortCode'];
    this.theme = json['theme'];
    this.state = json['state'];
    this.memo = json['memo'];
    this.isBinding = json['isBinding'];
    this.insideLineNumber = json['insideLineNumber'];
    this.outsideLineNumber = json['outsideLineNumber'];
    this.roomNumber = json['roomNumber'];
    this.headPortrait = json['headPortrait'];
    this.signature = json['signature'];
    this.oaEmail = json['oaEmail'];
    this.companyEmail = json['companyEmail'];
    this.specId = json['specId'];
    this.specName = json['specName'];
    this.roleId = json['roleId'];
    this.headFile = json['headFile'];
    this.signatureFile = json['signatureFile'];
    this.teamId = json['teamId'];
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
    data['deleteMark'] = this.deleteMark;
    data['userId'] = this.userId;
    data['accountTerm'] = this.accountTerm;
    data['userType'] = this.userType;
    data['identityNumber'] = this.identityNumber;
    data['userName'] = this.userName;
    data['realName'] = this.realName;
    data['password'] = this.password;
    data['designDriveLetter'] = this.designDriveLetter;
    data['ipAddress'] = this.ipAddress;
    data['birthDate'] = this.birthDate;
    data['hostName'] = this.hostName;
    data['userTitle'] = this.userTitle;
    data['phone'] = this.phone;
    data['macAddress'] = this.macAddress;
    data['departmentId'] = this.departmentId;
    data['sortCode'] = this.sortCode;
    data['theme'] = this.theme;
    data['state'] = this.state;
    data['memo'] = this.memo;
    data['isBinding'] = this.isBinding;
    data['insideLineNumber'] = this.insideLineNumber;
    data['outsideLineNumber'] = this.outsideLineNumber;
    data['roomNumber'] = this.roomNumber;
    data['headPortrait'] = this.headPortrait;
    data['signature'] = this.signature;
    data['oaEmail'] = this.oaEmail;
    data['companyEmail'] = this.companyEmail;
    data['specId'] = this.specId;
    data['specName'] = this.specName;
    data['roleId'] = this.roleId;
    data['headFile'] = this.headFile;
    data['signatureFile'] = this.signatureFile;
    data['teamId'] = this.teamId;
    return data;
  }
}

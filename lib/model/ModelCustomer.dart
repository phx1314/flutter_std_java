class ModelCustomer {
  String message;
  bool success;
  int code;
  List<DataListBean> data;

  ModelCustomer({this.message, this.success, this.code, this.data});

  ModelCustomer.fromJson(Map<String, dynamic> json) {    
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
  String createEmpId;
  String createEmpName;
  String createDeptId;
  String createDeptName;
  String modifyEmpId;
  String modifyEmpName;
  String deleteDate;
  String deleteEmpId;
  String deleteEmpName;
  String customerId;
  String type;
  String name;
  String region;
  String address;
  String legalRepresentative;
  String zipCode;
  String phone;
  String email;
  String fax;
  String website;
  String bankName;
  String bankAccount;
  String taxFileNumber;
  String memo;
  String files;
  String createTime;
  String typeName;
  String regionName;
  bool deleteMark;
  num createDate;

  DataListBean({this.tenantId, this.createEmpId, this.createEmpName, this.createDeptId, this.createDeptName, this.modifyEmpId, this.modifyEmpName, this.deleteDate, this.deleteEmpId, this.deleteEmpName, this.customerId, this.type, this.name, this.region, this.address, this.legalRepresentative, this.zipCode, this.phone, this.email, this.fax, this.website, this.bankName, this.bankAccount, this.taxFileNumber,  this.memo, this.files, this.createTime, this.typeName, this.regionName, this.deleteMark, this.createDate});

  DataListBean.fromJson(Map<String, dynamic> json) {    
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
    this.customerId = json['customerId'];
    this.type = json['type'];
    this.name = json['name'];
    this.region = json['region'];
    this.address = json['address'];
    this.legalRepresentative = json['legalRepresentative'];
    this.zipCode = json['zipCode'];
    this.phone = json['phone'];
    this.email = json['email'];
    this.fax = json['fax'];
    this.website = json['website'];
    this.bankName = json['bankName'];
    this.bankAccount = json['bankAccount'];
    this.taxFileNumber = json['taxFileNumber'];
    this.memo = json['memo'];
    this.files = json['files'];
    this.createTime = json['createTime'];
    this.typeName = json['typeName'];
    this.regionName = json['regionName'];
    this.deleteMark = json['deleteMark'];
    this.createDate = json['createDate'];
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
    data['customerId'] = this.customerId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['region'] = this.region;
    data['address'] = this.address;
    data['legalRepresentative'] = this.legalRepresentative;
    data['zipCode'] = this.zipCode;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['fax'] = this.fax;
    data['website'] = this.website;
    data['bankName'] = this.bankName;
    data['bankAccount'] = this.bankAccount;
    data['taxFileNumber'] = this.taxFileNumber;
    data['memo'] = this.memo;
    data['files'] = this.files;
    data['createTime'] = this.createTime;
    data['typeName'] = this.typeName;
    data['regionName'] = this.regionName;
    data['deleteMark'] = this.deleteMark;
    data['createDate'] = this.createDate;
    return data;
  }
}

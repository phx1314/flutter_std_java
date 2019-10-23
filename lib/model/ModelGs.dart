class ModelGs {
  String message;
  bool success;
  int code;
  List<DataListBean> data;

  ModelGs({this.message, this.success, this.code, this.data});

  ModelGs.fromJson(Map<String, dynamic> json) {    
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
  String id;
  String name;
  String logo;
  String htmlName;
  String createEmpId;
  String createEmpName;
  String deleteDate;
  String deleteEmpId;
  String deleteEmpName;
  int deleteMark;
  num createDate;

  DataListBean({this.id, this.name, this.logo, this.htmlName, this.createEmpId, this.createEmpName, this.deleteDate, this.deleteEmpId, this.deleteEmpName, this.deleteMark, this.createDate});

  DataListBean.fromJson(Map<String, dynamic> json) {    
    this.id = json['id'];
    this.name = json['name'];
    this.logo = json['logo'];
    this.htmlName = json['htmlName'];
    this.createEmpId = json['createEmpId'];
    this.createEmpName = json['createEmpName'];
    this.deleteDate = json['deleteDate'];
    this.deleteEmpId = json['deleteEmpId'];
    this.deleteEmpName = json['deleteEmpName'];
    this.deleteMark = json['deleteMark'];
    this.createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['htmlName'] = this.htmlName;
    data['createEmpId'] = this.createEmpId;
    data['createEmpName'] = this.createEmpName;
    data['deleteDate'] = this.deleteDate;
    data['deleteEmpId'] = this.deleteEmpId;
    data['deleteEmpName'] = this.deleteEmpName;
    data['deleteMark'] = this.deleteMark;
    data['createDate'] = this.createDate;
    return data;
  }
}

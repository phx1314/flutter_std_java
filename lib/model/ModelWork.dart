class ModelWork {
  String message;
  bool success;
  int code;
  List<ModelWorkBean> data;

  ModelWork({this.message, this.success, this.code, this.data});

  ModelWork.fromJson(Map<String, dynamic> json) {
    this.message = json['message'];
    this.success = json['success'];
    this.code = json['code'];
    this.data = (json['data'] as List)!=null?(json['data'] as List).map((i) => ModelWorkBean.fromJson(i)).toList():null;
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

class ModelWorkBean {
  String tenantId;
  String menuId;
  String menuCode;
  String parentId;
  String menuName;
  String path;
  String component;
  String params;
  String mobileShow;
  String parentCode;
  bool hidden;
  bool authorized;
  int sortCode;
  int type;
  List<ModelWorkBean> children;

  ModelWorkBean({this.tenantId, this.menuId, this.menuCode, this.parentId, this.menuName, this.path, this.component, this.params, this.mobileShow, this.parentCode, this.hidden, this.authorized, this.sortCode, this.type, this.children});

  ModelWorkBean.fromJson(Map<String, dynamic> json) {
    this.tenantId = json['tenantId'];
    this.menuId = json['menuId'];
    this.menuCode = json['menuCode'];
    this.parentId = json['parentId'];
    this.menuName = json['menuName'];
    this.path = json['path'];
    this.component = json['component'];
    this.params = json['params'];
    this.mobileShow = json['mobileShow'];
    this.parentCode = json['parentCode'];
    this.hidden = json['hidden'];
    this.authorized = json['authorized'];
    this.sortCode = json['sortCode'];
    this.type = json['type'];
    this.children = (json['children'] as List)!=null?(json['children'] as List).map((i) => ModelWorkBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenantId'] = this.tenantId;
    data['menuId'] = this.menuId;
    data['menuCode'] = this.menuCode;
    data['parentId'] = this.parentId;
    data['menuName'] = this.menuName;
    data['path'] = this.path;
    data['component'] = this.component;
    data['params'] = this.params;
    data['mobileShow'] = this.mobileShow;
    data['parentCode'] = this.parentCode;
    data['hidden'] = this.hidden;
    data['authorized'] = this.authorized;
    data['sortCode'] = this.sortCode;
    data['type'] = this.type;
    data['children'] = this.children != null?this.children.map((i) => i.toJson()).toList():null;
    return data;
  }
}


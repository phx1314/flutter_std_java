class ModelEmployee {
  String message;
  bool success;
  int code;
  QueryResultBean queryResult;

  ModelEmployee({this.message, this.success, this.code, this.queryResult});

  ModelEmployee.fromJson(Map<String, dynamic> json) {    
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
  String id;
  String name;
  String parentId;
  String data;
  String data1;
  String data2;
  String data3;
  int type;
  List<ChildrenListBean> children;

  ListListBean({this.id, this.name, this.parentId, this.data, this.data1, this.data2, this.data3, this.type, this.children});

  ListListBean.fromJson(Map<String, dynamic> json) {    
    this.id = json['id'];
    this.name = json['name'];
    this.parentId = json['parentId'];
    this.data = json['data'];
    this.data1 = json['data1'];
    this.data2 = json['data2'];
    this.data3 = json['data3'];
    this.type = json['type'];
    this.children = (json['children'] as List)!=null?(json['children'] as List).map((i) => ChildrenListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['parentId'] = this.parentId;
    data['data'] = this.data;
    data['data1'] = this.data1;
    data['data2'] = this.data2;
    data['data3'] = this.data3;
    data['type'] = this.type;
    data['children'] = this.children != null?this.children.map((i) => i.toJson()).toList():null;
    return data;
  }
}

class ChildrenListBean {
  String id;
  String name;
  String parentId;
  String data;
  String data1;
  String data2;
  String data3;
  String children;
  int type;

  ChildrenListBean({this.id, this.name, this.parentId, this.data, this.data1, this.data2, this.data3, this.children, this.type});

  ChildrenListBean.fromJson(Map<String, dynamic> json) {    
    this.id = json['id'];
    this.name = json['name'];
    this.parentId = json['parentId'];
    this.data = json['data'];
    this.data1 = json['data1'];
    this.data2 = json['data2'];
    this.data3 = json['data3'];
    this.children = json['children'];
    this.type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['parentId'] = this.parentId;
    data['data'] = this.data;
    data['data1'] = this.data1;
    data['data2'] = this.data2;
    data['data3'] = this.data3;
    data['children'] = this.children;
    data['type'] = this.type;
    return data;
  }
}

import 'ModelKeys.dart';

class ModelProj {
  String message;
  bool success;
  int code;
  List<ModelNodesListBean> data;

  ModelProj({this.message, this.success, this.code, this.data});

  ModelProj.fromJson(Map<String, dynamic> json) {
    this.message = json['message'];
    this.success = json['success'];
    this.code = json['code'];
    this.data = (json['data'] as List) != null
        ? (json['data'] as List)
            .map((i) => ModelNodesListBean.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    data['code'] = this.code;
    data['data'] =
        this.data != null ? this.data.map((i) => i.toJson()).toList() : null;
    return data;
  }
}

import 'ModelSysData.dart';

class ModelDetailBean {
  String value;

  String id;

  String title;

  String hint;

  bool isEnable;

  bool isMust;
  int type; //0 编辑 1 时间选择 2 选人 单选 3 选人 多选 4 单选 5 多选 6 标题
  ModelSysData mModelSysData;

  ModelDetailBean(this.title, this.type,
      {this.hint = '',
      this.isEnable = true,
      this.isMust = false,
      this.value = '',
      this.id = ''});
}

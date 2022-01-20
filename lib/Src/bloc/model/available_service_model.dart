class AvailableServiceModel {
  AvailableServiceModel({
    required this.id,
    required this.title,
    required this.selected,
  });
  late final int id;
  late final String title;
  late final int selected;

  AvailableServiceModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['selected'] = selected;
    return _data;
  }
}
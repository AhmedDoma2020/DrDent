
class SpecializationModel {
  SpecializationModel({
    required this.id,
    required this.title,
    this.active =false,
  });
  late final int id;
  late final String title;
  late final String image;
  late bool active;

  SpecializationModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    active = json['selected'] == 1 ? true : false;
  }
}

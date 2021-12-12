
class CityModel {
  CityModel({
    required this.id,
    required this.title,
  });
  late final int id;
  late final String title;

  CityModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
  }
}
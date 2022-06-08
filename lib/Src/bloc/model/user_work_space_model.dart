
class UserWorkSpaceModel {
  UserWorkSpaceModel({
    required this.id,
    required this.image,
    required this.name,
    required this.address,
  });
  late final int id;
  late final String image;
  late final String name;
  late final String address;

  UserWorkSpaceModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    image = json['image']??'';
    name = json['name']??'';
    address = json['address']??'';
  }

}
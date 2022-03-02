class Doctor{

  int? id;
  String? name;
  String? image;
  String? specialist;

  Doctor({this.id, this.image,this.specialist,this.name});

  Doctor.fromJson(Map<String,dynamic> map){
    id = map['id']??0;
    image = map['image']??' ';
    name = map['name']??'';
    specialist = map['specialist']??'';
  }
}

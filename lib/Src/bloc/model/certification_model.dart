class CertificationModel{
  int? id;
  String? image;
  CertificationModel({this.id, this.image});
  CertificationModel.fromJson(Map<String,dynamic> map){
    id = map['id']??0;
    image = map['image']??' ';
  }
}

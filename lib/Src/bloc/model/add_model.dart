
class AddModel{
  int? id;
  int? productId;
  String? title;
  String? image;
  String? link;

  AddModel({this.id, this.title, this.image,this.productId,this.link });

  AddModel.fromJson(Map<String , dynamic> map){
    this.id = map['id']??0;
    this.productId = map['product_id']??0;
    this.title = map['title']??'';
    this.image = map['image']??'';
    this.link = map['link']??'';
  }
}

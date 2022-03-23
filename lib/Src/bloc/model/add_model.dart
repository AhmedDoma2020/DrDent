
class AddModel{
  int? id;
  int? productId;
  String? title;
  String? image;
  String? link;

  AddModel({this.id, this.title, this.image,this.productId,this.link });

  AddModel.fromJson(Map<String , dynamic> map){
    id = map['id']??0;
    productId = map['product_id']??0;
    title = map['title']??'';
    image = map['image']??'';
    link = map['link']??'';
  }
}

class Adds{

  int? id;
  String? image;
  String? link;

  Adds({this.id, this.image,this.link});

  Adds.fromJson(Map<String,dynamic> map){
    id = map['id']??0;
    image = map['image']??' ';
    link = map['link']??'';
  }

}

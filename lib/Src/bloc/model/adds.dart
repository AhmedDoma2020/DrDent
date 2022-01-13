class Adds{

  int? id;
  String? image;



  Adds({this.id, this.image});

  Adds.fromJson(Map<String,dynamic> map){
    id = map['id']??0;
    image = map['image']??' ';
  }

}

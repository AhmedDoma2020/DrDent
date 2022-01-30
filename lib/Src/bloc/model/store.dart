class Store{

  int? id;
  String? name; 
  String? image;
  String? phone;
  String? address;
  String? lat;
  String? lon;
  String? history;
  List<String>? lisences;
  int? rate ;
  int? reviewers;


  Store({this.id, this.name, this.image, this.phone, this.address, this.lat,
    this.lon, this.history, this.lisences,this.rate,this.reviewers});

  Store.fromJson(Map<String,dynamic> map){
    id = map['id']??0;
    rate = map['rate']??0;
    reviewers = map['reviewers']??0;
    name = map['name']??' ';
    image = map['image']??' ';
    phone = map['phone']??' ';
    address = map['address']??' ';
    lat = map['lat']??' ';
    lon = map['lon']??' ';
    history = map['about']??' ';
    lisences = map['lisences']!=null ? map['lisences'].cast<String>() :[];
  }

}

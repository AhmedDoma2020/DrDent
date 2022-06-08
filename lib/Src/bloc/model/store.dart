import 'package:flutter/cupertino.dart';

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
  int? open;



  Store({this.id, this.name, this.image, this.phone, this.address, this.lat,
    this.lon, this.history, this.lisences,this.rate,this.reviewers,this.open});

  Store.fromJson(Map<String,dynamic> map){
    id = map['id']??0;
    rate = map['rate']??0;
    open = map['open']??0;
    debugPrint("map['open'] is ${map['open']??8}");
    reviewers = map['reviewers']??0;
    name = map['name']??' ';
    image = map['image']??' ';
    phone = map['phone']??' ';
    address = map['address']??' ';
    lat = map['lat'] != null  ?   map['lat'].toString() : "0.0";
    lon = map['lon']!= null  ? map['lon'].toString() :"0.0";
    history = map['about']??' ';
    lisences = map['lisences']!=null ? map['lisences'].cast<String>() :[];
  }

}

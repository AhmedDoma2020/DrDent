

import 'package:flutter/cupertino.dart';

class WorkSpaceDetailsModel {
  WorkSpaceDetailsModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.phone2,
    required this.price,
    required this.detectionTime,
    required this.reservationType,
    required this.image,
    required this.city,
    required this.address,
    required this.bulidingNumber,
    required this.flatNumber,
    required this.isSelected,
  });
  late final int id;
  late final String name;
  late final String phone;
  late final String phone2;
  late final String price;
  late final String detectionTime;
  late final String dayBooking;
  late final int reservationType;
  late final String image;
  late final String city;
  late final Address address;
  late final String bulidingNumber;
  late final String flatNumber;
  late  bool isSelected;

  WorkSpaceDetailsModel.fromJson(Map<String, dynamic> json){
    id = json['id']??"";
    name = json['name']??"";
    phone = json['phone']??"";
    phone2 = json['mobile']??"";
    price = json['price']??"";
    detectionTime = json['detection_time']??"";
    if(json['day_booking']!=null){
      dayBooking = json['day_booking']??"";
    }else{
      dayBooking = "";
    }
    reservationType = json['reservation_type']??0;
    image = json['image']??"";
    city = json['city']??"";
    if(json['address']!=null){
      address = Address.fromJson(json['address']);
    }else{
      address = [] as Address;
    }
    bulidingNumber = json['buliding_number']??"";
    flatNumber = json['flat_number']??"";
    isSelected = false ;
  }
}


class Address {
  Address({
    required this.id,
    required this.cityId,
    required this.stateId,
    required this.city,
    required this.state,
    required this.address,
    required this.bulidingNumber,
    required this.flatNumber,
    required this.mark,
    required this.lat,
    required this.lon,

  });
  late final int id;
  late final int cityId;
  late final int stateId;
  late final String city;
  late final String state;
  late final String address;
  late final String bulidingNumber;
  late final String flatNumber;
  late final String mark;
  late final double lat;
  late final double lon;

  Address.fromJson(Map<String, dynamic> json){
    id = json['id']??"";
    cityId = json['city_id']??"";
    stateId = json['state_id']??"";
    city = json['city']??"";
    state = json['state']??"";
    address = json['address']??"";
    bulidingNumber = json['buliding_number']??"";
    flatNumber = json['flat_number']??"";
    mark = json['mark']??"";
    lat = json['lat']??0.0;
    lon = json['lon']??0.0;
  }
}
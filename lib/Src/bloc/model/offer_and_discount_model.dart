
import 'package:dr_dent/Src/bloc/model/service_model.dart';
import 'package:flutter/cupertino.dart';

class OfferAndDiscountModel {
  OfferAndDiscountModel({
    required this.id,
    required this.title,
    required this.price,
    required this.priceAfterOffer,
    required this.offerInfo,
    required this.bookingInfo,
    required this.startDate,
    required this.endDate,
    required this.services,
    required this.image,
  });
  late final int id;
  late final String title;
  late final String price;
  late final String priceAfterOffer;
  late final String offerInfo;
  late final String bookingInfo;
  late final String startDate;
  late final String endDate;
  late final List<Services> services;
  late final String image;
  late final String servicesTitle;

  OfferAndDiscountModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    title = json['title']??"";
    debugPrint("json['price'] is ${json['price']}");
    price = json['price'].toString() ;
    priceAfterOffer = json['price_after_offer']??"";
    offerInfo = json['offer_info']??"";
    bookingInfo = json['booking_info']??"";
    startDate = json['start_date']??"";
    endDate = json['end_date']??"";
    if(json['services']!=null){
      services = List.from(json['services']).map((e)=>Services.fromJson(e)).toList();
      if(services.isNotEmpty){
        List<String> servicesList=[];
        for(var item in services){
          servicesList.add(item.title);
        }
        servicesTitle = servicesList.join(",");
      }
    }


    image = json['image']??"";
  }
//   OfferAndDiscountModel.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     offerStatus = json['ofer_status'];
//     image = json['image'];
//     ownerName = json['owner_name'];
//     name = json['name'];
//     priceAfterDiscount = json['price_after_discount'];
//     startDate = json['start_date'];
//     price = json['price'];
//     endDate = json['end_date'];
//     bookingInfo = json['booking_info'];
//     offerInfo = json['offer_info'];
//     // services = json['Services'];
//   }
}

class Services {
  Services({
    required this.id,
    required this.title,
    required this.selected,
  });
  late final int id;
  late final String title;
  late final int selected;

  Services.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    title = json['title']??"";
    selected = json['selected']??"";
  }
}

//
// class OfferAndDiscountModel {
//   OfferAndDiscountModel({
//     required this.id,
//     required this.offerStatus,
//     required this.ownerName,
//     required this.name,
//     required this.image,
//     required this.priceAfterDiscount,
//     required this.startDate,
//     required this.price,
//     required this.endDate,
//     required this.bookingInfo,
//     required this.offerInfo,
//     required this.services,
//   });
//   late final int id;
//   late final int offerStatus;
//   late final String ownerName;
//   late final String name;
//   late final String image;
//   late final String priceAfterDiscount;
//   late final String startDate;
//   late final String price;
//   late final String endDate;
//   late final String bookingInfo;
//   late final String offerInfo;
//   late final List<ServiceModel> services;
//
//   OfferAndDiscountModel.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     offerStatus = json['ofer_status'];
//     image = json['image'];
//     ownerName = json['owner_name'];
//     name = json['name'];
//     priceAfterDiscount = json['price_after_discount'];
//     startDate = json['start_date'];
//     price = json['price'];
//     endDate = json['end_date'];
//     bookingInfo = json['booking_info'];
//     offerInfo = json['offer_info'];
//     // services = json['Services'];
//   }
// }

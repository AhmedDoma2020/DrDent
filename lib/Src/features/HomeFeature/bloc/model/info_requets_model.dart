import 'package:dr_dent/Src/features/HomeFeature/ui/widgets/home_item.dart';
import 'package:get/get.dart';


// class InfoRequestModel{
//     int? id;
//     String? name;
//     String? phone;
//
//     InfoRequestModel({this.id, this.name, this.phone});
//
//     InfoRequestModel.fromJson(Map<String,dynamic> map){
//       id = map['id']??0;
//       name = map['name']??'';
//       phone = map['phone']!=null ? map['phone'].toString() : ' ';
//     }
// }


class InfoRequestModel {
  InfoRequestModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.userImage,
    required this.product,
  });
  late final int id;
  late final String name;
  late final String phone;
  late final String userImage;
  late final Product product;

  InfoRequestModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    name = json['name']??"";
    phone = json['phone'];
    userImage = json['user_image']??"";
    if(json['product'] != null){
      product = Product.fromJson(json['product']);
    }
  }

}

class Product {

  Product({
    required this.id,
    required this.categoryTitle,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.expireDate,
    required this.usability,
    required this.generalUse,
    required this.sideEffects,
    required this.images,
    required this.companyName,
    required this.companyId,
    required this.like,
  });

  late final int id;
  late final String categoryTitle;
  late final int categoryId;
  late final String title;
  late final String description;
  late final String expireDate;
  late final String usability;
  late final String generalUse;
  late final String sideEffects;
  late final List<String> images;
  late final String companyName;
  late final int companyId;
  late final int like;

  Product.fromJson(Map<String, dynamic> json){
    id = json['id'] ??0;
    categoryTitle = json['category_title']??"";
    categoryId = json['category_id']??"";
    title = json['title']??"";
    description = json['description']??"";
    expireDate = json['expire_date']??"";
    usability = json['usability']??"";
    generalUse = json['general_use']??"";
    sideEffects = json['side_effects']??"";
    images = List.castFrom<dynamic, String>(json['images']);
    companyName = json['company_name']??"";
    companyId = json['company_id']??"";
    like = json['like']??"";
  }


}


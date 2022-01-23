import 'package:dr_dent/Src/bloc/model/service_model.dart';

class PostModel{

  int? id;
  int? ownerId;
  String? ownerName;
  String? ownerImage;
  String? content;
  String? date;
  int? likesNumber;
  int? commentsNumber;
  int? shareNumber;
  List<String>? images;
  List<ServiceModel>? services;
  int? like;

  PostModel({this.id, this.ownerId, this.ownerName, this.ownerImage, this.content,
    this.likesNumber,this.services, this.commentsNumber, this.shareNumber, this.images,this.like,this.date});

  PostModel.fromJson(Map<String,dynamic> map){
    id = map['id']??0;
    ownerId = map['owner_id']??0;
    ownerName = map['owner_name']??'';
    ownerImage = map['owner_image']??'';
    content = map['content']??'';
    date = map['date']??'';
    likesNumber = map['likes_number']??0;
    commentsNumber = map['commentsNumber']??0;
    shareNumber = map['shareNumber']??0;
    like = map['like']??0;
    images = map['images']!=null ? map['images'].cast<String>():[];
    services = [];
  }

}

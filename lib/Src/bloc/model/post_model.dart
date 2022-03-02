import 'package:dr_dent/Src/bloc/model/service_model.dart';



enum PostType{
  post,
  share
}


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



  String? shareName;
  String? shareContent;
  String? shareImage;
  int? shareId;
  int? shareLikeNumbers;
  int? shareCommentsNumbers;
  int? shareSharesNumbers;

  late PostType postType;



  PostModel({this.id, this.ownerId, this.ownerName, this.ownerImage, this.content,
    this.likesNumber,this.services, this.commentsNumber, this.shareNumber, this.images,this.like,this.date,postType=PostType.post,
    this.shareCommentsNumbers,this.shareContent,this.shareId,this.shareImage,this.shareLikeNumbers,this.shareName,this.shareSharesNumbers
  });

  PostModel.fromJson(Map<String,dynamic> map){
    id = map['id']??0;
    ownerId = map['owner_id']??0;
    ownerName = map['owner_name']??'';
    ownerImage = map['owner_image']??'';
    content = map['content']??'';
    date = map['date']??'';
    likesNumber = map['likes_number']??0;
    commentsNumber = map['comments_number']??0;
    shareNumber = map['share_number']??0;
    like = map['like']??0;
    images = map['images']!=null ? map['images'].cast<String>():[];
    services = [];

    postType =   map['sharer_id']!=null ? PostType.share:PostType.post;

    shareName = map['sharer_name']??'';
    shareContent = map['shared_content']??'';
    shareImage = map['sharer_image']??'';
    shareId = map['sharer_id']??0;
    shareLikeNumbers = map['shared_likes_number']??0;
    shareSharesNumbers = map['shared_share_number']??0;
    shareCommentsNumbers = map['shared_comments_number']??0;


  }

}

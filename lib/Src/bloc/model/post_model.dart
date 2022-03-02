import 'package:dr_dent/Src/bloc/model/service_model.dart';
import 'package:flutter/cupertino.dart';

enum PostType { post, share }

class PostModel {
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
  List<PostTo>? postTo;
  int? like;
  String? shareName;
  String? shareContent;
  String? shareImage;
  int? shareId;
  int? shareLikeNumbers;
  int? shareCommentsNumbers;
  int? shareSharesNumbers;

  late PostType postType;

  PostModel(
      {this.id,
      this.ownerId,
      this.ownerName,
      this.ownerImage,
      this.content,
      this.likesNumber,
      this.services,
      this.commentsNumber,
      this.shareNumber,
      this.images,
      this.like,
      this.date,
      this.postTo,
      postType = PostType.post,
      this.shareCommentsNumbers,
      this.shareContent,
      this.shareId,
      this.shareImage,
      this.shareLikeNumbers,
      this.shareName,
      this.shareSharesNumbers,
      });

  PostModel.fromJson(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    ownerId = map['owner_id'] ?? 0;
    ownerName = map['owner_name'] ?? '';
    ownerImage = map['owner_image'] ?? '';
    content = map['content'] ?? '';
    date = map['duration'] ?? '';
    likesNumber = map['likes_number'] ?? 0;
    commentsNumber = map['comments_number'] ?? 0;
    shareNumber = map['share_number'] ?? 0;
    like = map['like'] ?? 0;
    images = map['images'] != null ? map['images'].cast<String>() : [];
    postTo = List.from(map['post_to']).map((e) =>PostTo.fromJson(e)).toList();
    services = [];
    postType = map['sharer_id'] != null ? PostType.share : PostType.post;
    shareName = map['sharer_name'] ?? '';
    shareContent = map['shared_content'] ?? '';
    shareImage = map['sharer_image'] ?? '';
    shareId = map['sharer_id'] ?? 0;
    shareLikeNumbers = map['shared_likes_number'] ?? 0;
    shareSharesNumbers = map['shared_share_number'] ?? 0;
    shareCommentsNumbers = map['shared_comments_number'] ?? 0;
  }
}

class PostTo{
   int? id;
   String? title;

  PostTo({
    this.id, this.title
  });

  PostTo.fromJson(Map<String, dynamic> map){
    id = map['id'] ?? 0;
    title = map['title']??"";
  }
}

//
// class AutoGenerate {
//   AutoGenerate({
//     required this.status,
//     required this.message,
//     required this.data,
//   });
//   late final bool status;
//   late final String message;
//   late final Data data;
//
//   AutoGenerate.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     message = json['message'];
//     data = Data.fromJson(json['data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['message'] = message;
//     _data['data'] = data.toJson();
//     return _data;
//   }
// }
//
// class Data {
//   Data({
//     required this.data2,
//     required this.links,
//     required this.meta,
//   });
//   late final List<Data2> data2;
//   late final Links links;
//   late final Meta meta;
//
//   Data.fromJson(Map<String, dynamic> json){
//     data2 = List.from(json['data2']).map((e)=>Data2.fromJson(e)).toList();
//     links = Links.fromJson(json['links']);
//     meta = Meta.fromJson(json['meta']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['data2'] = data2.map((e)=>e.toJson()).toList();
//     _data['links'] = links.toJson();
//     _data['meta'] = meta.toJson();
//     return _data;
//   }
// }
//
// class Data2 {
//   Data2({
//     required this.id,
//     required this.ownerName,
//     required this.ownerId,
//     required this.ownerImage,
//     required this.content,
//     required this.likesNumber,
//     required this.commentsNumber,
//     required this.shareNumber,
//     required this.images,
//     required this.services,
//     required this.postTo,
//     required this.duration,
//   });
//   late final int id;
//   late final String ownerName;
//   late final int ownerId;
//   late final String ownerImage;
//   late final String content;
//   late final int likesNumber;
//   late final int commentsNumber;
//   late final int shareNumber;
//   late final List<String> images;
//   late final int services;
//   late final List<PostTo> postTo;
//   late final String duration;
//
//   Data2.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     ownerName = json['owner_name'];
//     ownerId = json['owner_id'];
//     ownerImage = json['owner_image'];
//     content = json['content'];
//     likesNumber = json['likes_number'];
//     commentsNumber = json['comments_number'];
//     shareNumber = json['share_number'];
//     images = json['images'];
//     services = json['services'];
//     postTo = json['post_to'];
//     duration = json['duration'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['owner_name'] = ownerName;
//     _data['owner_id'] = ownerId;
//     _data['owner_image'] = ownerImage;
//     _data['content'] = content;
//     _data['likes_number'] = likesNumber;
//     _data['comments_number'] = commentsNumber;
//     _data['share_number'] = shareNumber;
//     _data['images'] = images;
//     _data['services'] = services;
//     _data['post_to'] = postTo;
//     _data['duration'] = duration;
//     return _data;
//   }
// }
//
// class PostTo {
//   PostTo({
//     required this.id,
//     required this.title,
//   });
//   late final int id;
//   late final String title;
//
//   PostTo.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     title = json['title'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['title'] = title;
//     return _data;
//   }
// }
//
// class Links {
//   Links({
//     required this.first,
//     required this.last,
//     this.prev,
//     required this.next,
//   });
//   late final String first;
//   late final String last;
//   late final Null prev;
//   late final String next;
//
//   Links.fromJson(Map<String, dynamic> json){
//     first = json['first'];
//     last = json['last'];
//     prev = null;
//     next = json['next'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['first'] = first;
//     _data['last'] = last;
//     _data['prev'] = prev;
//     _data['next'] = next;
//     return _data;
//   }
// }
//
// class Meta {
//   Meta({
//     required this.currentPage,
//     required this.from,
//     required this.lastPage,
//     required this.links,
//     required this.path,
//     required this.perPage,
//     required this.to,
//     required this.total,
//   });
//   late final int currentPage;
//   late final int from;
//   late final int lastPage;
//   late final List<Links> links;
//   late final String path;
//   late final int perPage;
//   late final int to;
//   late final int total;
//
//   Meta.fromJson(Map<String, dynamic> json){
//     currentPage = json['current_page'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     links = List.from(json['links']).map((e)=>Links.fromJson(e)).toList();
//     path = json['path'];
//     perPage = json['per_page'];
//     to = json['to'];
//     total = json['total'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['current_page'] = currentPage;
//     _data['from'] = from;
//     _data['last_page'] = lastPage;
//     _data['links'] = links.map((e)=>e.toJson()).toList();
//     _data['path'] = path;
//     _data['per_page'] = perPage;
//     _data['to'] = to;
//     _data['total'] = total;
//     return _data;
//   }
// }
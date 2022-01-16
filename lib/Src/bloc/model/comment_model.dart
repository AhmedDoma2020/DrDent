import 'dart:html';

class CommentModel{

  int? id;
  String? userName;
  String? userImage;
  int? userId;
  int? likesCount;
  String? comment;
  List<CommentModel>? comments;


  CommentModel({this.id, this.userName, this.userImage, this.userId,
    this.likesCount, this.comment, this.comments});

  CommentModel.fromJson(Map<String,dynamic> map){
    id = map['id']??0;
    userId = map['user_id']??0;
    likesCount = map['likes_count']??0;
    userName = map['user_name']??' ';
    userImage = map['user_image']??' ';
    comment = map['comment']??' ';
    comments = [];
  }
}

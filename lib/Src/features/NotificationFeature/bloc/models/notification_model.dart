
class NotificationModel {
  NotificationModel({
    this.id,
    this.title,
    this.subtitle,
    this.image,
  });

  int? id;
  String? title;
  String? subtitle;
  String? image;

  NotificationModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    title = json['title']??'';
    subtitle = json['subtitle']??'';
    image = json['image']??'';
  }
}


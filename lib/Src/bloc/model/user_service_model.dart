
class UserServiceModel {
  UserServiceModel({
    required this.id,
    required this.serviceTitle,
    required this.price,
    required this.waitingTime,
  });
  late final int id;
  late final String serviceTitle;
  late final int price;
  late final int waitingTime;

  UserServiceModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    serviceTitle = json['service_title']??'';
    price = json['price']??0;
    waitingTime = json['waiting_time']??0;
  }

}
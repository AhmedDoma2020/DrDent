class ServiceModel {
  ServiceModel({
    required this.id,
    required this.title,
    required this.price,
    required this.time,
    required this.selected,
  });
  late final int id;
  late final String title;
  late final String price;
  late final String time;
  late  bool selected;
  ServiceModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    if(json['price'] != null){
      price = json['price'].toString();
    }else{price = "";}
    title = json['service_title']??"";
    if(json['waiting_time'] != null){
      time = json['waiting_time'].toString();
    }else{time = "";}
    selected = false;
  }
}

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
    // selected = json['selected'];
  }
}

List<ServiceModel> myServiceModelExample = [
ServiceModel(
  selected: false,
title: "تركيبات الأسنان الثابتة",
id: 1,
price: "150",
time:"30:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 5,
price: "150",
time:"11:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 3,
price: "150",
time:"2:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 4,
price: "150",
time:"70:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 5,
price: "150",
time:"30:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 6,
price: "150",
time:"80:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 7,
price: "150",
time:"30:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 8,
price: "150",
time:"30:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 9,
price: "150",
time:"70:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 10,
price: "150",
time:"60:30",
),
];
List<ServiceModel> availableServiceModelExample = [
ServiceModel(
  selected: false,
title: "تركيبات الأسنان الثابتة",
id: 1,
price: "150",
time:"30:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 5,
price: "150",
time:"11:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 3,
price: "150",
time:"2:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 4,
price: "150",
time:"70:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 5,
price: "150",
time:"30:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 6,
price: "150",
time:"80:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 7,
price: "150",
time:"30:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 8,
price: "150",
time:"30:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 9,
price: "150",
time:"70:30",
),ServiceModel(
    selected: false,
title: "تركيبات الأسنان الثابتة",
id: 10,
price: "150",
time:"60:30",
),
];
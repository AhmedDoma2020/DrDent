
class AssistantModel {
  AssistantModel({
    required this.id,
    required this.name,
    required this.phone,
  });

  late final int id;
  late final String name;
  late final String phone;

  AssistantModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    phone = json['image'];
    name = json['title'];
  }

}

List<AssistantModel> myAssistantExample = [
  AssistantModel(
    id: 1,
    phone:"0111234216" ,
    name: "Ahmed Doma",
  ), AssistantModel(
    id: 2,
    phone:"0111234216" ,
    name: "Ahmed Doma",
  ), AssistantModel(
    id: 3,
    phone:"0111234216" ,
    name: "Ahmed Doma",
  ), AssistantModel(
    id: 4,
    phone:"0111234216" ,
    name: "Ahmed Doma",
  ), AssistantModel(
    id: 5,
    phone:"0111234216" ,
    name: "Ahmed Doma",
  ), AssistantModel(
    id: 6,
    phone:"0111234216" ,
    name: "Ahmed Doma",
  ), AssistantModel(
    id: 7,
    phone:"0111234216" ,
    name: "Ahmed Doma",
  ), AssistantModel(
    id: 8,
    phone:"0111234216" ,
    name: "Ahmed Doma",
  ), AssistantModel(
    id: 9,
    phone:"0111234216" ,
    name: "Ahmed Doma",
  ), AssistantModel(
    id: 10,
    phone:"0111234216" ,
    name: "Ahmed Doma",
  ),
];
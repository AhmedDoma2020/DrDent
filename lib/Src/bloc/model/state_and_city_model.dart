class StateAndCityModel {
  StateAndCityModel({
    required this.id,
    required this.title,
    required this.cityModel,
  });
  late final int id;
  late final String title;
  late final String image;
  late final List<CityModel> cityModel;

  StateAndCityModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    if (json["cities"] != null) _setDiagnose(json["cities"]);
  }
  void _setDiagnose(List<dynamic> jsonObject) {
    if (jsonObject.isNotEmpty) {
      for (var item in jsonObject) {
        if (item != null) {
          cityModel.add(CityModel.fromJson(item));
        }
      }
    }
  }
}

class CityModel {
  CityModel({
    required this.id,
    required this.title,
  });
  late final int id;
  late final String title;
  late final String image;

  CityModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
  }
}

List<StateAndCityModel> stateAndCityListExample = [
  StateAndCityModel(
    title: "المنصوره",
    id: 1,
    cityModel: [
      CityModel(
        id:1 ,
        title: "جلاء",
      ),
      CityModel(
        id: 2,
        title: "درسات",
      ),
      CityModel(
        id:3,
        title: "مجزر",
      ),
    ],
  ),
  StateAndCityModel(
    title: "المحله",
    id: 1,
    cityModel: [
      CityModel(
        id:1 ,
        title: "محب",
      ),
      CityModel(
        id: 2,
        title: "شكري",
      ),
      CityModel(
        id:3,
        title: "المشحمه",
      ),
    ],
  ),
];
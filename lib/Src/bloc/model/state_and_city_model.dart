class StateAndCityModel {
  StateAndCityModel({
    required this.id,
    required this.title,
    required this.cities,
  });
  late final int id;
  late final String title;
  late final List<Cities> cities;

  StateAndCityModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    cities = List.from(json['cities']).map((e)=>Cities.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['cities'] = cities.map((e)=>e.toJson()).toList();
    return _data;
  }

}
class Cities {
  Cities({
    required this.id,
    required this.title,
  });
  late final int id;
  late final String title;

  Cities.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    return _data;
  }
}
//
// List<StateAndCityModel> stateAndCityListExample = [
//   StateAndCityModel(
//     title: "المنصوره",
//     id: 1,
//     cityModel: [
//       CityModel(
//         id:1 ,
//         title: "جلاء",
//       ),
//       CityModel(
//         id: 2,
//         title: "درسات",
//       ),
//       CityModel(
//         id:3,
//         title: "مجزر",
//       ),
//     ],
//   ),
//   StateAndCityModel(
//     title: "المحله",
//     id: 1,
//     cityModel: [
//       CityModel(
//         id:1 ,
//         title: "محب",
//       ),
//       CityModel(
//         id: 2,
//         title: "شكري",
//       ),
//       CityModel(
//         id:3,
//         title: "المشحمه",
//       ),
//     ],
//   ),
// ];
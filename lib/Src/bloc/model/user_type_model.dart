import 'package:get/get.dart';
class UserType {
  int id;
  String title;
  UserType({required this.id,required this.title});
}

List<UserType> types = [
  UserType(
    id: 0,
    title: "mal_doctor".tr,
  ),
  UserType(
    id: 1,
    title: "female_doctor".tr,
  ),
];
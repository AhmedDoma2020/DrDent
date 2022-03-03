import 'package:get/get.dart';

class UserType {
  int id;
  String val;
  String title;

  UserType({required this.id, required this.title, required this.val,});
}

List<UserType> genderTypes = [
  UserType(
    id: 0,
    val:"male",
    title: "mal_doctor".tr,
  ),
  UserType(
    id: 1,
    val:"female",
    title: "female_doctor".tr,
  ),
];

List<UserType> jobTypes = [
  UserType(
    id: 0,
    val:"male",
    title: "full_time".tr,
  ),
  UserType(
    id: 1,
    val:"female",
    title: "part_time".tr,
  ),
];
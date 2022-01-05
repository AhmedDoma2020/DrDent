import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';


class UniversityDegreeModel {
  UniversityDegreeModel({
    required this.id,
    required this.title,
    required this.isSelected,

  });

  late final int id;
  late final String title;
  late int isSelected;

  UniversityDegreeModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    title = json['title']??' ';
    isSelected = json['isSelected']??' ';
  }
}

List<UniversityDegreeModel> universityDegreeModelExamples = [
  UniversityDegreeModel(
    id: 1,
    title: 'excellence_'.tr,
      isSelected:0,
  ),
  UniversityDegreeModel(
    id: 2,
    title: 'very_good'.tr,
    isSelected:0,
  ),
  UniversityDegreeModel(
    id: 3,
    title: 'good_'.tr,
    isSelected:0,
  ),
  UniversityDegreeModel(
    id: 3,
    title: 'acceptable_'.tr,
    isSelected:0,
  ),
];
import 'package:flutter/material.dart';


class ChoiceModel {
  ChoiceModel({
    required this.id,
    required this.title,

  });

  late final int id;
  late final String title;

  ChoiceModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    title = json['title']??' ';

  }
}

List<ChoiceModel> choiceModelExamples = [
  ChoiceModel(
      id: 1,
      title: 'اختيار واحد',
  ),
  ChoiceModel(
      id: 2,
      title: 'اختيار اتنين',
  ),
  ChoiceModel(
      id: 3,
      title: 'اختيار تلاته',
  ),
];
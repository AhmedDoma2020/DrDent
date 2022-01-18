import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class FetchYearsOfGraduationController extends GetxController {

  List<int> _yearsOfGraduationList = [];
  List<int> get yearsOfGraduation => _yearsOfGraduationList;
  DateTime dateTime =DateTime.now();
  int _yearOfGraduationSIndex = -1;
  int get yearOfGraduationSIndex => _yearOfGraduationSIndex;
  void changeSIndex(value) {
    _yearOfGraduationSIndex = value;
    update();
  }

  Future<void> fetchYearsOfGraduation() async {
    for( int i = 0 ; i <= 60; i++ ) {
      _yearsOfGraduationList.add(dateTime.year - i);
      print("i $i");
    }
    // _yearsOfGraduationList = [...yearsOfGraduationList2];
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchYearsOfGraduation();
    print("yearsOfGraduationList2 $_yearsOfGraduationList");
  }




}

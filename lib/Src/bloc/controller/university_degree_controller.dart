import 'package:dr_dent/Src/bloc/model/university_degree_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FetchUniversityDegreeController extends GetxController {
  List<UniversityDegreeModel> _universityDegreeList = [];
  List<UniversityDegreeModel> get universityDegreeList => _universityDegreeList;

  int _universityDegreeSIndex = -1;
  int get universityDegreeSIndex => _universityDegreeSIndex;
  void changeSIndex(index) {
    _universityDegreeSIndex = index;
    update();
  }
  Future<void> fetchYearsOfGraduation() async {
   _universityDegreeList =[...universityDegreeModelExamples];
    // _yearsOfGraduationList = [...yearsOfGraduationList2];
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchYearsOfGraduation();
    debugPrint("_universityDegreeSIndex $_universityDegreeSIndex");
  }
}

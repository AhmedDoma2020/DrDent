import 'package:dr_dent/Src/bloc/repository/set_experience_years_repo.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
class SetExperienceYearsController extends GetxController{
  TextEditingController? graduationYearController;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  int _yearOfGraduation = 0;
  int get yearOfGraduation => _yearOfGraduation;
  set setYearOfGraduation(int value) {
    _yearOfGraduation = value;
  }
  final SetExperienceYearsRepository _setExperienceYearsRepository =SetExperienceYearsRepository();
  void submit() async{
    if(globalKey.currentState!.validate()){
      globalKey.currentState!.save();
      setLoading();
      var response = await _setExperienceYearsRepository.setExperienceYears(workYear:graduationYearController!.text );
      Get.back();
      if(response.statusCode == 200 && response.data["status"] == true){
        Get.back();
        customSnackBar(title: response.data["message"]??"");
      }else{
        customSnackBar(title: response.data["message"]??"");
      }
    }else{
      customSnackBar(title: "must_select_year".tr);
    }
  }

  @override
  void onInit() {
    super.onInit();
    graduationYearController = TextEditingController();
  }

  @override
  void dispose() {
    graduationYearController?.dispose();
    super.dispose();
  }
}
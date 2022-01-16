

import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/check_phone_repo.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/reset_password_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/verfication_screen.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';


class CheckPhoneController extends GetxController{

  TextEditingController? phoneController;
  bool phoneNotEmpty =  false;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final ChickPhoneRepository _chickPhoneRepository = ChickPhoneRepository();
  void submit() async{
    if(globalKey.currentState!.validate()){
      globalKey.currentState!.save();
      setLoading();
      var response =  await _chickPhoneRepository.chickPhone(phone: phoneController!.text);
      Get.back();
      if(response.statusCode == 200 && response.data["status"] == true){
        Get.to(ResetPasswordScreen(phone:  phoneController!.text,));
        customSnackBar(title: response.data['message']?? "",);
      }else{
        customSnackBar(title: response.data['message']?? "",);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    phoneController!.addListener(() {
      if(phoneController!.text.isNotEmpty){
        phoneNotEmpty = true;
      }else{
        phoneNotEmpty = false;
      }
      update();
    });
  }


  @override
  void dispose() {
    phoneController?.dispose();
    super.dispose();
  }
}
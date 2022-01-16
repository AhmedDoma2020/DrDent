

import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/reset_password_repo.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/login_screen.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';


class ResetPasswordController extends GetxController{
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final ResetPasswordRepository _resetPasswordRepository = ResetPasswordRepository();
  void submit({required String phone}) async{
    if(globalKey.currentState!.validate()){
      globalKey.currentState!.save();
      // setLoadingDialog();
      var response = await _resetPasswordRepository.resetPassword(phone: phone, password: passwordController!.text);

      if(response.statusCode == 200 && response.data["status"] == true) {
        customSnackBar(title: response.data['message']?? "",);
        Get.offAll( ()=>LoginScreen());
      }else{
        customSnackBar(title: response.data['message']?? "",);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }


  @override
  void dispose() {
    passwordController?.dispose();
    confirmPasswordController?.dispose();
    super.dispose();
  }
}
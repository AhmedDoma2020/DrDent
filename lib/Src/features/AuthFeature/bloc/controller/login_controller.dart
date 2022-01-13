

import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/login_repo.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/forget_password_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/account_type_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';


class LoginController extends GetxController{

  TextEditingController? phoneController;
  TextEditingController? passwordController;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
 final LogInRepository _logInRepository =LogInRepository();
  void submit() async{
    if(globalKey.currentState!.validate()){
       globalKey.currentState!.save();
      // setLoadingDialog();
      var response = await _logInRepository.logIn(phone: phoneController!.text, password: passwordController!.text,);
     if(response.statusCode ==200 && response.data["status"] == true){
       print('my phone is ${phoneController!.value.text}');
       print('my phone is ${passwordController!.value.text}');
       String phone = phoneController!.value.text;
       if(phoneController!.value.text.isNotEmpty){
         if(phoneController!.value.text.startsWith('0')){
           phone = phoneController!.value.text.replaceFirst('0','');
         }
       }
     }
    }
  }

  void moveToForgetPassword(){
    Get.to(()=>ForgetPasswordScreen());
  }

  void moveToRegister(){
    // Get.back();
    Get.to(()=>AccountTypeScreen());
  }

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }


  @override
  void dispose() {
    phoneController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }
}
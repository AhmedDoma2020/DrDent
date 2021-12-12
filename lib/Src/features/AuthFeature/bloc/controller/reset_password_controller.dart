

import 'package:dr_dent/Src/features/AuthFeature/ui/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';


class ResetPasswordController extends GetxController{


  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  void submit({required String phone}) async{
    if(globalKey.currentState!.validate()){
      globalKey.currentState!.save();
      // setLoadingDialog();
      Get.offAll( ()=>LoginScreen());
      print('my password is ${passwordController!.value.text}');
      print('my confirm is ${confirmPasswordController!.value.text}');
      // String phone = phoneController!.value.text;
      // if(phoneController!.value.text.isNotEmpty){
      //   if(phoneController!.value.text.startsWith('0')){
      //     phone = phoneController!.value.text.replaceFirst('0','');
      //   }
      // }

      // Get.dialog(
      //     DialogPasswordSuccess(),
      // );

    }
  }

  // void onForgetPassword(){
  //   Get.to(()=>CheckPhoneScreen());
  // }
  //
  // void moveToRegister(){
  //   // Get.back();
  //   Get.to(()=>RegisterScreen());
  // }

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
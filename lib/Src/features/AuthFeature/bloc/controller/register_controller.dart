

import 'package:dr_dent/Src/features/AuthFeature/ui/screens/business_license_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';


class RegisterController extends GetxController{

  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? passwordController;
  TextEditingController? emailController;

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  void submit() async{
    if(globalKey.currentState!.validate()){
      globalKey.currentState!.save();
      print('my name is ${nameController!.value.text}');
      print('my phone is ${phoneController!.value.text}');
      print('my password is ${passwordController!.value.text}');
      print('my confirm is ${emailController!.value.text}');
      Get.to(()=> BusinessLicenseScreen());
      // String phone = phoneController!.value.text;
      // if(phoneController!.value.text.isNotEmpty){
      //   if(phoneController!.value.text.startsWith('0')){
      //     phone = phoneController!.value.text.replaceFirst('0','');
      //   }
      // }
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
    nameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }


  @override
  void dispose() {
    nameController?.dispose();
    phoneController?.dispose();
    passwordController?.dispose();
    emailController?.dispose();
    super.dispose();
  }
}
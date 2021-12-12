

import 'dart:async';

import 'package:dr_dent/Src/features/AuthFeature/ui/screens/reset_password_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class VerficationController extends GetxController{
  final String phone;
   VerficationController({Key? key, required this.phone});

  TextEditingController? textEditingController;
  StreamController<ErrorAnimationType>? errorController;

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  void submit() async{
    if(globalKey.currentState!.validate()){
      globalKey.currentState!.save();
      Get.to(()=> ResetPasswordScreen(phone: phone));
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
    textEditingController = TextEditingController();
    errorController = StreamController<ErrorAnimationType>();
  }


  @override
  void dispose() {
    errorController!.close();
    textEditingController!.dispose();
    super.dispose();
  }
}
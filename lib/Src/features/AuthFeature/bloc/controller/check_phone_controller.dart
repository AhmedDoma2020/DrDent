

import 'package:dr_dent/Src/features/AuthFeature/ui/screens/verfication_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';


class CheckPhoneController extends GetxController{

  TextEditingController? phoneController;
  bool phoneNotEmpty =  false;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  void submit() async{

    if(globalKey.currentState!.validate()){
      globalKey.currentState!.save();
      Get.to(()=>VerificationScreen(phone: phoneController!.text,));
      // setLoadingDialog();
      // print('my phone is ${phoneController!.value.text}');
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
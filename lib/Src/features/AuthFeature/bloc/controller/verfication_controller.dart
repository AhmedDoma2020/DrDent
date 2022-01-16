import 'dart:async';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/verify_phone_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class VerficationController extends GetxController{
  TextEditingController? textEditingController;
  StreamController<ErrorAnimationType>? errorController;
  VerifyPhoneController _verifyPhoneController = Get.put(VerifyPhoneController());
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  void verify({VoidCallback? onSuccess,bool register = true}) async{
    if(globalKey.currentState!.validate()){
      globalKey.currentState!.save();
      if(register){
        _verifyPhoneController.setVerify();
      }
    }
  }

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
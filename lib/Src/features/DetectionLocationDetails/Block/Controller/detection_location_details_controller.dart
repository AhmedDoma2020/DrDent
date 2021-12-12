

import 'package:dr_dent/Src/features/AuthFeature/ui/screens/forget_password_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/account_type_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';


class DetectionLocationDetailsController extends GetxController{

  TextEditingController? phone1Controller;
  TextEditingController? phone2Controller;
  TextEditingController? nameController;
  TextEditingController? priceExaminationController;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  void submit() async{
    if(globalKey.currentState!.validate()){
      globalKey.currentState!.save();
      // setLoadingDialog();
      print('my phone is ${phone1Controller!.value.text}');
      print('my phone is ${priceExaminationController!.value.text}');
      String phone = phone1Controller!.value.text;
      if(phone1Controller!.value.text.isNotEmpty){
        if(phone1Controller!.value.text.startsWith('0')){
          phone = phone1Controller!.value.text.replaceFirst('0','');
        }
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    phone1Controller = TextEditingController();
    phone2Controller = TextEditingController();
    nameController = TextEditingController();
    priceExaminationController = TextEditingController();
  }


  @override
  void dispose() {
    phone1Controller?.dispose();
    phone2Controller?.dispose();
    nameController?.dispose();
    priceExaminationController?.dispose();
    super.dispose();
  }
}
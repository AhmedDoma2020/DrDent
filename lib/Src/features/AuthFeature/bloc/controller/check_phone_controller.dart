

import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/check_phone_repo.dart';
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
      // setLoadingDialog();
      var response =  await _chickPhoneRepository.chickPhone(phone: phoneController!.text);
      if(response.statusCode == 200 && response.data["status"] == true){
        print('my phone is ${phoneController!.value.text}');
        String phone = phoneController!.value.text;
        if(phoneController!.value.text.isNotEmpty){
          if(phoneController!.value.text.startsWith('0')){
            phone = phoneController!.value.text.replaceFirst('0','');
            Get.to(()=>VerificationScreen(phone: phone,));
          }
        }
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
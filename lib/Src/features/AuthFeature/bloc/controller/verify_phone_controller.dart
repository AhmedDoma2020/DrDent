

import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/verify_phone_repository.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';



class VerifyPhoneController extends GetxController{
  RequestStatus status = RequestStatus.initial;
  GetStorage box = GetStorage();
  final VerifyPhoneRepository _verifyPhoneRepository = VerifyPhoneRepository();
  Future<void> setVerify() async{
    setLoading();
    var response = await _verifyPhoneRepository.verifyPhone();
    Get.back();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      if(response.data['data']!=null){
        box.write('api_token',response.data['data']['token']);
        debugPrint("api_token in VerifyPhoneController1>:- ${response.data['data']['token']}");
        debugPrint("api_token in VerifyPhoneController2>:- ${box.read('api_token')??' '}");
        box.write('name',response.data['data']['name']);
        box.write('phone',response.data['data']['phone']);
        box.write('login',true);
        // Get.offAll(()=>BaseScreens());
      }
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    }else{
      status = RequestStatus.done;
      update();
      customSnackBar(title:response.data['message']??'حدث خطآ ما');
    }
  }
}
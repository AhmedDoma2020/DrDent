import 'dart:async';

import 'package:dr_dent/Src/features/BaseFeature/ui/screens/base_screen.dart';
import 'package:dr_dent/Src/features/OnBoardingFeature/ui/views/on_boarding_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class SplashController extends GetxController{

  GetStorage box = GetStorage();
  // GetStorage box = GetStorage('onBoard');
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      if(box.read("log_in") == 1){
        Get.offAll(()=> BaseScreen());
      }else{
        Get.offAll(()=>OnBoardingScreen());
      }
      // if(box.hasData('onBoard')){
      //   Get.to(()=>BaseScreens());
      // }else{
      //   Get.to(()=>OnBoardingScreen());
      // }
    });
    update();
  }


}


import 'package:dr_dent/Src/bloc/model/lang_model.dart';
import 'package:dr_dent/Src/core/services/Lang/localization_services.dart';
import 'package:dr_dent/Src/features/BaseFeature/ui/screens/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LangController extends GetxController{
   int _active =0;
  int get active => _active;
  GetStorage box = GetStorage();
  void changeLangIndex(value){
    _active=value;
    update();
  }

  void changeLang(langId){
    if(_active==1){
      LocalizationServices().changeLocale("Arabic");
      box.write("lan", "ar");
      box.write("language", "arabic");
      Get.offAll(()=>BaseScreen());
      update();
    } else if(_active ==2){
      LocalizationServices().changeLocale("English");
      box.write("language", "english");
      box.write("lan", "en");
      Get.offAll(()=>BaseScreen());
      update();
    }
    update();
  }

  List<langModel> langList = [
    langModel(
      id: 1,
      flag:"assets/icons/saudi-arabia.png",
      langTitle:"العربية" ,
    ),
    langModel(
      id:2,
      flag:"assets/icons/united-kingdom.png",
      langTitle:"English",
    ),
  ];
}
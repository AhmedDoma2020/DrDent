import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'ar_EG.dart';
import 'en_US.dart';


class LocalizationServices extends Translations {
  static const locale = Locale("en", "US");
  static const fallBackLocale = Locale("en", "US");

  static final langs = ["English", "Arabic"];
  static final locales = [
    const Locale("en", "US"),
    const Locale("ar", "AE"),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
    "en_US": enUS,
    "ar_AE": arAE,
  };
  void changeLocale(String lang) {
    final locale = getLocaleFormLanguage(lang);
    final box = GetStorage();
    box.write("lng", lang);
    Get.updateLocale(locale!);
  }

  Locale? getLocaleFormLanguage(String lang) {
    for (int i = 0; i < lang.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }

  Locale getCurrentLocale(){
    final box =GetStorage();
    Locale defaultLocale;
    if(box.read("lng") != null){
      final locale = getLocaleFormLanguage(box.read("lng"));
      defaultLocale = locale!;
    }else {
      defaultLocale =const Locale("ar", "AE");
    }
    return defaultLocale;
  }

  String getCurrentLang(){
    final box = GetStorage();
    return box.read("lng") != null ? box.read("lng") : 'English';
  }

}
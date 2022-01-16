import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Src/core/services/Lang/localization_services.dart';
import 'Src/features/BaseFeature/ui/screens/base_screen.dart';






void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(375, 812),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
        transitionDuration:const Duration(milliseconds: 200),
        translations: LocalizationServices(),
        locale: LocalizationServices().getCurrentLocale(),
        title: 'DrDent',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:BaseScreen(),
      ),
    );
  }
}



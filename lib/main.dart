import 'package:dr_dent/Src/features/AuthFeature/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'Src/core/services/Lang/localization_services.dart';
import 'Src/features/AuthFeature/ui/screens/start_now_screen.dart';
import 'Src/features/AuthFeature/ui/screens/wating_screen.dart';
import 'Src/features/DetectionLocationDetails/Ui/Screen/detection_location_details_screen.dart';
import 'Src/features/InsuranceCompanies/Ui/Screen/insurance_companies_screen.dart';
import 'Src/features/OnBoardingFeature/ui/views/on_boarding_screen.dart';
import 'Src/features/SplachFeature/ui/splash_screen.dart';

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
        title: 'Pickup',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:InsuranceCompanies(),
      ),
    );
  }
}


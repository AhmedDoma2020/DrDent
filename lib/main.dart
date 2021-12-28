import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Src/core/services/Lang/localization_services.dart';

import 'Src/features/JobFeature/ui/screens/job_screen.dart';
import 'Src/features/JobFeature/ui/screens/jobs_screen.dart';
import 'Src/features/StoreFeature/ui/screens/product_screen.dart';
import 'Src/features/StoreFeature/ui/screens/stotre_screen.dart';
import 'Src/features/VisitsFeature/ui/screens/my_visits_screen.dart';

import 'Src/features/AuthFeature/ui/screens/enter_my_personal_data_screen.dart';
import 'Src/features/ProfileFeature/ProfileScreen/Ui/View/profile_screen.dart';



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
        home:ProductScreen(),
      ),
    );
  }
}



import 'package:dr_dent/Src/features/WorkTimeFeature/ui/screens/work_time_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Src/core/services/Lang/localization_services.dart';
import 'Src/features/ProfileFeature/GlobalServicesFeature/AddOfferFeature/Ui/View/my_offer_screen.dart';
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
        title: 'Pickup',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:ProfileScreen(),

      ),
    );
  }
}



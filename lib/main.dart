
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/login_screen.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/screens/work_time_screen.dart';
import 'package:dr_dent/Src/features/SplachFeature/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Src/core/services/Lang/localization_services.dart';
import 'Src/features/AuthFeature/ui/screens/set_business_license_screen.dart';
import 'Src/features/BaseFeature/ui/screens/base_screen.dart';
import 'Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/View/Screens/set_detection_location_details_screen.dart';
import 'Src/features/JobFeature/ui/screens/job_screen.dart';
import 'Src/features/JobFeature/ui/screens/jobs_screen.dart';
import 'Src/features/JobFeature/ui/screens/saved_jobs.dart';
import 'Src/features/NotificationFeature/ui/screens/notifications_screen.dart';
import 'Src/features/PackagesFeature/ui/screens/packages_screen.dart';
import 'Src/features/SocialFeature/ui/screens/add_post_screen.dart';
import 'Src/features/SocialFeature/ui/screens/comments_screen.dart';
import 'Src/features/StaticFeature/ui/screens/change_language.dart';
import 'Src/features/StaticFeature/ui/screens/privacy_screen.dart';
import 'Src/features/StaticFeature/ui/screens/questions_screen.dart';
import 'Src/features/StaticFeature/ui/screens/support_screen.dart';
import 'Src/features/StoreFeature/ui/screens/all_products_screen.dart';
import 'Src/features/StoreFeature/ui/screens/company_screen.dart';
import 'Src/features/DrawerFeature/View/Ui/contact_with_mail_screen.dart';
import 'Src/features/JobFeature/ui/screens/add_a_job_offer_screen.dart';
import 'Src/features/JobFeature/ui/screens/job_screen.dart';
import 'Src/features/JobFeature/ui/screens/jobs_screen.dart';
import 'Src/features/JobFeature/ui/screens/test.dart';
import 'Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Ui/View/center_doctor_screen.dart';
import 'Src/features/StoreFeature/ui/screens/product_screen.dart';
import 'Src/features/StoreFeature/ui/screens/saved_products.dart';
import 'Src/features/StoreFeature/ui/screens/stotre_screen.dart';
import 'Src/features/VisitsFeature/ui/screens/my_visits_screen.dart';
import 'Src/features/AuthFeature/ui/screens/enter_my_personal_data_screen.dart';
import 'Src/features/ProfileFeature/ProfileScreen/Ui/View/profile_screen.dart';
import 'Src/ui/widgets/grids/grid_card_product.dart';


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
        home:WorkTimeScreen(),
      ),
    );
  }
}



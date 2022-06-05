
import 'dart:convert';

import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/set_work_license_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/login_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/start_now_screen.dart';
import 'package:dr_dent/Src/features/DrawerFeature/View/Ui/lan_screen.dart';
import 'package:dr_dent/Src/features/OnBoardingFeature/ui/views/on_boarding_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Ui/Screen/insurance_companies_screen.dart';
import 'Src/features/ProfileFeature/GlobalInfoemationFeature/MyCertificationFeature/Ui/Screen/certification_of_doctor_screen.dart';
import 'Src/features/SocialProfileFeature/SocialProfileScreen/View/Screen/social_profile_screen.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/screens/work_time_screen.dart';
import 'package:dr_dent/Src/features/SplachFeature/ui/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Src/core/services/Lang/localization_services.dart';
import 'Src/features/AuthFeature/ui/screens/account_type_screen.dart';
import 'Src/features/AuthFeature/ui/screens/set_business_license_screen.dart';
import 'Src/features/AuthFeature/ui/screens/set_commercial_registration_and_tax_card_screen.dart';
import 'Src/features/AuthFeature/ui/screens/verfication_screen.dart';
import 'Src/features/BaseFeature/ui/screens/base_screen.dart';
import 'Src/features/ProfileFeature/GlobalInfoemationFeature/MyGeneralDataFeature/Ui/Screen/enter_personal_data_of_company_and_center.dart';
import 'Src/features/ProfileFeature/GlobalInfoemationFeature/MyGeneralDataFeature/Ui/Screen/enter_personal_data_of_graduated.dart';
import 'Src/features/ProfileFeature/GlobalMyProductFeature/MyProductFeature/View/Screens/company_add_product_screen.dart';
import 'Src/features/ProfileFeature/GlobalMyProductFeature/MyProductFeature/View/Screens/company_products_screen.dart';
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
import 'Src/features/ProfileFeature/GlobalInfoemationFeature/MyGeneralDataFeature/Ui/Screen/enter_personal_data_of_doctor_screen.dart';
import 'Src/features/ProfileFeature/ProfileScreen/Ui/View/profile_screen.dart';
import 'Src/ui/widgets/grids/grid_card_product.dart';

// start background
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  print(message.data);
  flutterLocalNotificationsPlugin.show(
      0,
      message.data['title'],
      message.data['body'],
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          enableVibration: true,
        ),
      ),
      payload: json.encode(message.data.toString())
  );
}
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.', // description
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
// end background

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  // start background
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  // end background
  runApp(MyApp());}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final FirebaseMessaging _messaging;
  void onSelectNotification(String? payload) async {
  }
  void registerNotification()async{
    await Firebase.initializeApp();
    // instance for firebase messaging
    _messaging = FirebaseMessaging.instance;
    _messaging.subscribeToTopic("all");
    _messaging.subscribeToTopic("shop");
    //three type of state in notification
    var initialzationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
    InitializationSettings(android: initialzationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification: onSelectNotification,);
    NotificationSettings seetings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound:true,
    );
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    if(seetings.authorizationStatus==AuthorizationStatus.authorized )
    {
      print("User granted the permission");
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print("notification message.notification1 is >>> ${message.data}");
        flutterLocalNotificationsPlugin.show(
            0,
            message.data['title'],
            message.data['body'],
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                enableVibration: true,
              ),
            ),
            payload: json.encode(message.data.toString())
        );
      });
    }else{
      print("permition declined by user");
    }
  }

  @override
  void initState() {
    registerNotification();
    super.initState();
  }

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
        home: SplashScreen(),
      ),
    );
  }
}

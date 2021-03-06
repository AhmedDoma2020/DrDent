import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/log_out_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/change_password_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/login_screen.dart';
import 'package:dr_dent/Src/features/DrawerFeature/View/Widget/row_of_item_drawer.dart';
import 'package:dr_dent/Src/features/DrawerFeature/View/Widget/top_info_drawer.dart';
import 'package:dr_dent/Src/features/NotificationFeature/ui/screens/notifications_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/View/profile_screen.dart';
import 'package:dr_dent/Src/features/StaticFeature/ui/screens/support_screen.dart';
import 'package:dr_dent/Src/features/VisitsFeature/ui/screens/my_visits_screen.dart';
import 'package:dr_dent/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../StaticFeature/ui/screens/conditions_screen.dart';
import '../../../StaticFeature/ui/screens/privacy_screen.dart';
import '../../../StoreFeature/ui/screens/saved_products.dart';
import 'lan_screen.dart';

class CustomDrawer extends StatelessWidget {
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    LogOutController _logOutController = Get.put(LogOutController());
    return Drawer(
      child: Container(
        // color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: TopInfoDrawer(),
            ),
            Divider(
              height: 2.h,
              color: kCMainGrey,
            ),
            14.0.ESH(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  RowOfItemDrawer(
                      onTap: () {
                        Get.to(() => ProfileScreen());
                      },
                      title: "Profile_",
                      icon: "assets/icons/personalInfoIcon.png"),
                  // RowOfItemDrawer(
                  //     onTap: () {
                  //       Get.to(() => MyVisitScreen());
                  //     },
                  //     title: "Reservations_",
                  //     icon: "assets/icons/personalInfoIcon.png"),
                  RowOfItemDrawer(
                      onTap: () {
                        Get.to(() => const ChangePasswordScreen());
                      },
                      title: "change_password",
                      icon: "assets/icons/lockIcon.png"),
                  RowOfItemDrawer(
                      onTap: () {
                        Get.to(() => NotificationsScreen());
                      },
                      title: "Notification_",
                      icon: "assets/icons/notification-bing.png"),
                  RowOfItemDrawer(
                      onTap: () {
                        Get.to(() => SavedProducts());
                      },
                      title: "fav_list",
                      icon: "assets/icons/heart.png"),
                  // RowOfItemDrawer(
                  //     onTap: () {
                  //       debugPrint("abc");
                  //     },
                  //     title: "saved_list",
                  //     icon: "assets/icons/savedIcon.png"),
                  RowOfItemDrawer(
                      onTap: () {
                        Get.to(() => LanScreen());
                      },
                      title: "lan_",
                      icon: "assets/icons/lanIconng.png"),
                  RowOfItemDrawer(
                      onTap: () {
                        Get.to(() => PrivacyScreen());
                      },
                      title: "Privacy_policy",
                      icon: "assets/icons/security-safe.png"),
                  RowOfItemDrawer(
                      onTap: () {
                        Get.to(() => ConditionsScreen());
                      },
                      title: "terms_and_Conditions",
                      icon: "assets/icons/privacyIcon.png"),
                  RowOfItemDrawer(
                      onTap: () {
                        Get.to(() => SupportScreen());
                      },
                      title: "support_",
                      icon: "assets/icons/headphone.png"),
                  RowOfItemDrawer(
                    onTap: () {
                      debugPrint("abc");
                      _logOutController.logOut();
                    },
                    title: "log_out",
                    icon: "assets/icons/logout.png",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

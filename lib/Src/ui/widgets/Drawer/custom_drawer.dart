import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/avatar_form.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/View/profile_screen.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'Widget/row_of_item_drawer.dart';
import 'Widget/top_info_drawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          // color: Colors.amber,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: const TopInfoDrawer(),
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
                    RowOfItemDrawer(onTap: (){Get.to(()=>ProfileScreen());},title: "Profile_",icon: "assets/icons/personalInfoIcon.png"),
                    RowOfItemDrawer(onTap: (){debugPrint("abc");},title: "Notification_",icon: "assets/icons/notification-bing.png"),
                    RowOfItemDrawer(onTap: (){debugPrint("abc");},title: "fav_list",icon: "assets/icons/heart.png"),
                    RowOfItemDrawer(onTap: (){debugPrint("abc");},title: "saved_list",icon: "assets/icons/savedIcon.png"),
                    RowOfItemDrawer(onTap: (){debugPrint("abc");},title: "lan_",icon: "assets/icons/lanIconng.png"),
                    RowOfItemDrawer(onTap: (){debugPrint("abc");},title: "Privacy_policy",icon: "assets/icons/security-safe.png"),
                    RowOfItemDrawer(onTap: (){debugPrint("abc");},title: "terms_and_Conditions",icon: "assets/icons/privacyIcon.png"),
                    RowOfItemDrawer(onTap: (){debugPrint("abc");},title: "support_",icon: "assets/icons/headphone.png"),
                    RowOfItemDrawer(onTap: (){debugPrint("abc");},title: "log_out",icon: "assets/icons/logout.png"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



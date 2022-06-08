import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalPublicationsFeature/ui/screens/my_posts.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/profile_tab_index_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/CenterWidgets/global_services_widget_of_center.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/UserInfoWidget/View/Screen/doctor_&_center_info.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/UserInfoWidget/View/Screen/graduated_info.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/UserServicesWidget/View/Sceen/user_services_widget.dart';
import 'package:dr_dent/Src/ui/widgets/tabs/tabs_ios.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SocialIOSTapBarWidgetOfGraduated extends StatelessWidget {
  final int userId;

  const SocialIOSTapBarWidgetOfGraduated({
    required this.userId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileTapIndexController());
    return  GetBuilder<ProfileTapIndexController>(
      builder: (_) => Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabsIos(
                  onTap: (index) {
                    _.tabIndex = index;
                  },
                  titles:[
                    'posts_'.tr,
                    'data_'.tr,
                  ],
                  tabIndex: _.tabIndex,
                  activeCardColor: Colors.white,
                  borderColor: Colors.transparent,
                  backGroundColor: kCGreySemiDark,
                ),
              ],
            ),
          ),
          SizedBox(
            child: [
              MySocialScreen(userId: userId),
              SocialProfileTapItemOfGraduatedInfo(),
            ][_.tabIndex],
          ),
          24.0.ESH(),
        ],
      ),
    );
  }
}

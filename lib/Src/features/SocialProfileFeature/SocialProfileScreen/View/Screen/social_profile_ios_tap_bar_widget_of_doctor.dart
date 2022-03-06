import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalPublicationsFeature/ui/screens/my_posts.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/profile_tab_index_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/CenterWidgets/global_services_widget_of_center.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/DoctorInfo/View/Screen/doctor_info.dart';
import 'package:dr_dent/Src/ui/widgets/tabs/tabs_ios.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SocialIOSTapBarWidgetOfDoctor extends StatelessWidget {
  final int userId;

  const SocialIOSTapBarWidgetOfDoctor({
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
                    'my_posts'.tr,
                    'Doctor_data'.tr,
                    'Doctor_services'.tr,
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
              SocialProfileTapItemOdDoctorInfo(),
              GlobalServicesWidgetOfCenter(),
            ][_.tabIndex],
          ),
          24.0.ESH(),
        ],
      ),
    );
  }
}

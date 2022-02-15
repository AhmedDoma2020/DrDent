import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Controller/fetch_my_services_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/profile_tab_index_controller.dart';
import '../Widget/DoctorWidgets/global_information_details_widget_of_doctor.dart';
import '../Widget/DoctorWidgets/global_services_widget_of_doctor.dart';
import 'package:dr_dent/Src/ui/widgets/tabs/tabs_ios.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ButtonTapBarWidgetOfDoctor extends StatelessWidget {
  const ButtonTapBarWidgetOfDoctor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileTapIndexController());
    return   GetBuilder<ProfileTapIndexController>(
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
                  titles: [
                    'my_data'.tr,
                    'my_services'.tr,
                    'my_posts'.tr,
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
            child:[
              GlobalInformationDetailsWidgetOfDoctor(),
              GlobalServicesWidgetOfDoctor(),
              GlobalInformationDetailsWidgetOfDoctor(),
            ][_.tabIndex],
          ),
          24.0.ESH(),
        ],
      ),
    );
  }
}

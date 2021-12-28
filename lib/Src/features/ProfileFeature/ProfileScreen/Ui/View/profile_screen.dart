import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_doctor_profile_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/profile_tab_index_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/global_information_details_widget.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/global_services_widget.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_info_widget.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_row_info_widget.dart';
import 'package:dr_dent/Src/ui/widgets/tabs/tabs_ios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileTapIndexController());
    Get.put(FetchProfileDoctorController());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ProfileTapIndexController>(
          builder: (_) => ListView(
            children: [
              profileInfoWidget(),
              ProfileRowInfoAndRate(),
              Padding(
                padding:  EdgeInsets.symmetric(
                    vertical: 16.h
                ),
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
              Expanded(
                child: [
                  GlobalInformationDetailsWidget(),
                  GlobalServicesWidget(),
                  GlobalInformationDetailsWidget(),
                ][_.tabIndex],
              ),
              24.0.ESH(),
            ],
          ),
        ),
      ),
    );
  }
}

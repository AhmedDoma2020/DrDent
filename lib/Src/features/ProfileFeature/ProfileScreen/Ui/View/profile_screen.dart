import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_profile_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/profile_tab_index_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/global_information_details_widget.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/global_my_product_widget.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/global_services_widget.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_info_widget.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_row_info_widget.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/tabs/tabs_ios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
   const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileTapIndexController());
    Get.put(FetchProfileController());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<FetchProfileController>(
          builder:(proController) => proController.status == RequestStatus.loading ? Center(child: Loader(),):
              GetBuilder<ProfileTapIndexController>(
            builder: (_) => ListView(
              children: [
                profileInfoWidget(),
                8.0.ESH(),
                ProfileRowInfoAndRate(),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TabsIos(
                        onTap: (index) {
                          _.tabIndex = index;
                        },
                        titles: proController.userTypeId == 3||proController.userTypeId == 4?[
                          'my_data'.tr,
                          'my_services'.tr,
                          'my_posts'.tr,
                        ] :proController.userTypeId == 5 || proController.userTypeId == 6? [
                          'my_data'.tr,
                          'my_products'.tr,
                          'my_posts'.tr,
                        ]:[
                          'my_data'.tr,
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
                  child: proController.userTypeId == 3||proController.userTypeId == 4? [
                    GlobalInformationDetailsWidget(userTypeId: proController.userTypeId!,),
                    GlobalServicesWidget(userTypeId: proController.userTypeId!,),
                    GlobalInformationDetailsWidget(userTypeId: proController.userTypeId!,),
                  ][_.tabIndex]:proController.userTypeId == 5 || proController.userTypeId == 6?

                  [
                    GlobalInformationDetailsWidget(userTypeId: proController.userTypeId!,),
                    GlobalMyProductWidget(),
                    GlobalInformationDetailsWidget(userTypeId: proController.userTypeId!,),
                  ][_.tabIndex]:
                  [
                    GlobalInformationDetailsWidget(userTypeId: proController.userTypeId!,),
                    GlobalInformationDetailsWidget(userTypeId: proController.userTypeId!,),
                  ][_.tabIndex],
                ),
                24.0.ESH(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/enter_my_personal_data_screen.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/screens/enter_your_information_to_apply_job_button_sheet.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Ui/Screen/insurance_companies_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/View/Screens/detection_location_details_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_profile_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_column_info_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalInformationDetailsWidget extends StatelessWidget {
  final int userTypeId;
  GlobalInformationDetailsWidget({required this.userTypeId});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.green,
      child: Column(
        children: [
          GetBuilder<FetchProfileController>(
            builder: (_) => ProfileColumnInfoItem(
              icon: "assets/icons/personalInfoIcon.png",
              title: "my_general_data",
              onTap: () {
                if (userTypeId == 3) {
                  Get.to(() => EnterDoctorPersonalDataScreen(
                        isEdit: true,
                      ));
                } else if (userTypeId == 4) {}
              },
            ),
          ),
          userTypeId == 5 || userTypeId == 6 ||userTypeId == 7? 0.0.ESH():
          Column(
            children: [
              16.0.ESH(),
              ProfileColumnInfoItem(
                icon: userTypeId == 3
                    ? "assets/icons/certificationIcon.png"
                    : userTypeId == 4
                    ? "assets/icons/centerBranches.png"
                    : "",
                title: userTypeId == 3
                    ? "my_certification"
                    : userTypeId == 4
                    ? "center_branches"
                    : "",
                onTap: () {
                  if (userTypeId == 3) {
                    Get.bottomSheet(
                      EnterYourInformationButtonSheet(
                        // onTap: (stateId, cityId) {
                        //   //TODO do filter jobs
                        // },
                      ),
                      isScrollControlled: true,
                    );
                  } else if (userTypeId == 4) {
                    Get.to(() => DetectionLocationDetailsScreen(
                      appBarTitle: "center_branches",
                    ));
                  }
                },
              ),
            ],
          ),
          userTypeId == 5 || userTypeId == 6 ||userTypeId == 7? 0.0.ESH():
         Column(
           children: [
             16.0.ESH(),
             ProfileColumnInfoItem(
               icon: "assets/icons/insuranceCompany.png",
               title: "insurance_companies",
               onTap: () {
                 Get.to(() => InsuranceCompaniesScreen());
               },
             ),
           ],
         ),
        ],
      ),
    );
  }
}

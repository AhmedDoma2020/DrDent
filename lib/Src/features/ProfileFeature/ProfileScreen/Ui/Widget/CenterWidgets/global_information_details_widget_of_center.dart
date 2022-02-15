import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Ui/Screen/insurance_companies_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/MyGeneralDataFeature/Ui/Screen/enter_personal_data_of_company_and_center.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/View/Screens/detection_location_details_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_profile_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_column_info_item.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/controller/work_time_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalInformationDetailsWidgetOfCenter extends StatelessWidget {
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
                Get.to(() => const EnterPersonalDataOfCompanyAndCenterScreen(
                      isEdit: true,
                    ));
              },
            ),
          ),
          Column(
            children: [
              16.0.ESH(),
              ProfileColumnInfoItem(
                icon: "assets/icons/centerBranches.png",
                title: "center_branches",
                onTap: () {
                  Get.to(() => DetectionLocationDetailsScreen(
                    userType: UserTypeEnum.doctor,
                        appBarTitle: "center_branches",
                      ));
                },
              ),
            ],
          ),
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

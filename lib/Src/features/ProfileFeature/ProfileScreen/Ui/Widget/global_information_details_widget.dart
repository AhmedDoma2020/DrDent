import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/enter_my_personal_data_screen.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/screens/enter_your_information_to_apply_job_button_sheet.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Ui/Screen/insurance_companies_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_profile_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_column_info_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GlobalInformationDetailsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.green,
      child: Column(
        children: [
          GetBuilder<FetchProfileDoctorController>(
            builder:(_) =>  ProfileColumnInfoItem(
              icon: "assets/icons/personalInfoIcon.png",
              title: "my_general_data",
              onTap: () {
                Get.to(EnterMyPersonalDataScreen(
                  name: _.name!,
                  degree: _.degree!,
                  gender: _.gender!,
                  note: "",
                  specialization:_.specialization!,
                  getPhotoOfWorkLicenses: _.photoOfWorkLicenses!,
                ));
              },
            ),
          ),
          16.0.ESH(),
          ProfileColumnInfoItem(
            icon: "assets/icons/certificationIcon.png",
            title: "my_certification",
            onTap: () {
              Get.bottomSheet(
                EnterYourInformationButtonSheet(
                  // onTap: (stateId, cityId) {
                  //   //TODO do filter jobs
                  // },
                ),
                isScrollControlled: true,
              );
            },
          ),
          16.0.ESH(),
          ProfileColumnInfoItem(
            icon: "assets/icons/insuranceCompany.png",
            title: "insurance_companies",
            onTap: () {
              Get.to(()=>InsuranceCompaniesScreen());
            },
          ),
        ],
      ),
    );
  }
}

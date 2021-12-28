import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/enter_my_personal_data_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Ui/Screen/insurance_companies_screen.dart';
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
          ProfileColumnInfoItem(
            icon: "assets/icons/personalInfoIcon.png",
            title: "my_general_data",
            onTap: () {
              Get.to(EnterMyPersonalDataScreen());
            },
          ),
          16.0.ESH(),
          ProfileColumnInfoItem(
            icon: "assets/icons/certificationIcon.png",
            title: "my_certification",
            onTap: () {},
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

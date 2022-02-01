import 'package:dr_dent/Src/core/utils/extensions.dart';
import '../../../../GlobalInfoemationFeature/MyGeneralDataFeature/Ui/Screen/enter_personal_data_of_doctor_screen.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/screens/enter_your_information_to_apply_job_button_sheet.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Ui/Screen/insurance_companies_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/View/Screens/detection_location_details_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_profile_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_column_info_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GlobalInformationDetailsWidgetOfCompany extends StatelessWidget {

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
              },
            ),
          ),
        ],
      ),
    );
  }
}

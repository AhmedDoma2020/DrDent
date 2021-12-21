import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_doctor_profile_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/global_services_widget.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_info_widget.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_row_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(FetchProfileDoctorController());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<FetchProfileDoctorController>(
          builder: (_) => Column(
            children: [
              profileInfoWidget(),
              ProfileRowInfoAndRate(),
              // GlobalInformationDetailsWidget(),
              GlobalServicesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}




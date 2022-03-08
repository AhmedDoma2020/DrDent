import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/UserInfoWidget/View/Widget/grid_of_doctor_certification.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/Block/Controller/featch_social_profile_controller.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/View/Widget/list_of_doctor_insurance_companies.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SocialProfileTapItemOfCompanyAndLabInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // color: Colors.green,
      child: GetBuilder<FetchSocialProfileController>(
        builder: (_) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: _.userProfileModel!.workAddress,
                fontW: FW.semicond,
              ),
              16.0.ESH(),
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/services/photo_view.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/View/Widget/c_v_widget.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/View/Widget/graduated_certificate_widget.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/UserInfoWidget/View/Widget/grid_of_doctor_certification.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/Block/Controller/featch_social_profile_controller.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/View/Widget/list_of_doctor_insurance_companies.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SocialProfileTapItemOfGraduatedInfo extends StatelessWidget {
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
                text: "${"Faculty_of_Dentistry".tr} ${_.userProfileModel!.universityTitle}",
                fontW: FW.semicond,
              ),
              12.0.ESH(),
              CustomText(
                text: _.userProfileModel!.specializationsTitle,
                fontW: FW.regular,
              ),
              8.0.ESH(),
              CustomText(
                text:
                    '${"graduation_year".tr} ${":"} ${_.userProfileModel!.graduationYear}',
                fontW: FW.regular,
              ),
              8.0.ESH(),
              CustomText(
                text:
                    '${"overall_rating".tr} ${":"} ${_.userProfileModel!.graduationDegree}',
                fontW: FW.regular,
              ),
              _.userProfileModel!.workLisence !=null && _.userProfileModel!.workLisence !=''?
              GraduatedCertificateWidget(image: _.userProfileModel!.workLisence):0.0.ESW(),
              _.userProfileModel!.cv !=null && _.userProfileModel!.cv !=''?
              CVWidget(cv: _.userProfileModel!.cv):0.0.ESH(),
            ],
          ),
        ),
      ),
    );
  }
}

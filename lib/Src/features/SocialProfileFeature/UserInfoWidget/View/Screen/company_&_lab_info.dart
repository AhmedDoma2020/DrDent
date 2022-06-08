import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/UserInfoWidget/View/Widget/grid_of_doctor_certification.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/Block/Controller/featch_social_profile_controller.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/View/Widget/list_of_doctor_insurance_companies.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
                text: _.userProfileModel!.address,
                fontW: FW.semicond,
              ),
              16.0.ESH(),
              ClipRRect(
                borderRadius: BorderRadius.circular(9.r),
                child: SizedBox(
                  height: 140.h,
                  width: double.infinity,
                  child: MapWidget(
                      coordinates: LatLng(
                          _.userProfileModel!.lat, _.userProfileModel!.lon)),
                ),
              ),
              16.0.ESH(),
              CustomText(
                text: 'Company_History',
                fontW: FW.semicond,
              ),
              8.0.ESH(),
              CustomText(
                text: _.userProfileModel!.about,

              ),
            ],
          ),
        ),
      ),
    );
  }
}

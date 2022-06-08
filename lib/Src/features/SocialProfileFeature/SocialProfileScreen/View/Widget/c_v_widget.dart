import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/services/photo_view.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/Block/Controller/featch_social_profile_controller.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/View/Widget/graduated_certificate_widget.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/View/Widget/list_of_doctor_insurance_companies.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/UserInfoWidget/View/Widget/grid_of_doctor_certification.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CVWidget extends StatelessWidget {
  final String cv;

  const CVWidget({
    required this.cv,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        14.0.ESH(),
        CustomText(
          text: 'C-V',
          fontW: FW.semicond,
        ),
        12.0.ESH(),
        Container(
          width: double.infinity,
          height: 82.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: kCSubMain.withOpacity(0.05),
            border: Border.all(
              color: kCSubMain,
              width: 1.w,
            ),
          ),
          child:
              ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child: GestureDetector(
                        onTap: () {
                          Get.to(() => PhotoViewWidget(
                                imageProvider:
                                    NetworkImage(cv),
                              ));
                        },
                        child: ImageNetwork(
                          url: cv,
                          height: double.infinity,
                          width: double.infinity,
                          boxFit: BoxFit.fill,
                        ),
                      ),
              )

        )
      ],
    );
  }
}

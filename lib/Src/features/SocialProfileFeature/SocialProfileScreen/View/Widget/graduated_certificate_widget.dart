import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/services/photo_view.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GraduatedCertificateWidget extends StatelessWidget {
  final String image;
  const GraduatedCertificateWidget({
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          14.0.ESH(),
          CustomText(text: 'graduation_certificate_image',fontW: FW.semicond,),
          12.0.ESH(),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Container(
              height: 100.h,
              width: 143.w,
              color: kCBGTextFormFiled,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => PhotoViewWidget(imageProvider: NetworkImage(image),));
                  },
                  child: ImageNetwork(
                    url: image,
                    height: double.infinity,
                    width: double.infinity,
                    boxFit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

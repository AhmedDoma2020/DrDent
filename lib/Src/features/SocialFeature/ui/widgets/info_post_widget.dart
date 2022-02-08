import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Controller/add_post_controller.dart';
import 'package:dr_dent/Src/features/SocialFeature/ui/widgets/share_with_button_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:dr_dent/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';



class InfoPostWidget extends StatelessWidget {
  const InfoPostWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24.r,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(777.r),
              child: ImageNetwork(
                url:box.read('image')??"",
                height: 48.w,
                width: 48.w,
              ),
            ),
          ),
          16.0.ESW(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               CustomText(
                  text: box.read('name')??"",
                  fontW: FW.bold,
                ),
              2.0.ESH(),
                ButtonDefault(
                  width: 80,
                  height: 48,
                  radius: 6,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<AddPostController>(
                          builder:(_) => SizedBox(
                              width: 52.w,
                              child: CustomText(text: _.shareWithButtonTitle.tr,overflow: true,maxLines: 1,)),
                        ),
                        // 4.0.ESW(),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: 10.w,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  borderColor: Colors.white,
                  buttonColor: Colors.white,
                  titleColor: kCBlackTitle,
                  titleSize: 13,
                  onTap: () {
                    Get.bottomSheet(
                      ShareWithButtonSheet(),
                      // isDismissible: false,
                      // enableDrag: false,
                    );
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}

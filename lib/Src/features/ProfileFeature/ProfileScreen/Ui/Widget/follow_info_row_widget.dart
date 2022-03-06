import 'package:dr_dent/Src/bloc/model/followers_model.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../ui/widgets/buttons/button_default.dart';

class FollowInfoRowWidget extends StatelessWidget {
  final FollowersModel followModel;
  const FollowInfoRowWidget({
    required this.followModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22.r,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(777.r),
                  child:  ImageNetwork(
                    url:
                    followModel.image,
                    height: 44,
                    width: 44,
                  ),
                ),
              ),
              16.0.ESW(),
              Column(
                children: [
                  SizedBox(
                    width: 160.w,
                    child: CustomText(
                      text: followModel.name,
                      maxLines: 1,
                      overflow: true,
                    ),
                  ),
                  4.0.ESH(),
                  SizedBox(
                    width: 160.w,
                    child: CustomText(
                      text: followModel.specializations,
                      maxLines: 1,
                      overflow: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ButtonDefault(
            title: 'follow_'.tr,
            iconImage: "blockProfile.png",
            height: 30,
            width: 96,
            radius: 4,
            titleSize: 12,
            onTap: () {},
          )
        ],
      ),
    );
  }
}

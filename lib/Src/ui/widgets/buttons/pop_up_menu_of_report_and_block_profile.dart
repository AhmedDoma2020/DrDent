

import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/Block/Controller/block_user_controller.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/Block/Controller/report_user_controller.dart';

import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class PopUpMenuOfReportAndBlockProfile extends StatelessWidget {
  final int userId;
  const PopUpMenuOfReportAndBlockProfile({
    required this.userId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlockUserController _blockUserController =  Get.put(BlockUserController());
    ReportUserController _reportUserController= Get.put(ReportUserController());
    return PopupMenuButton(
      icon: Icon(Icons.more_vert,
          color: Colors.black, size: 28.h),
      itemBuilder: (context) => <PopupMenuEntry>[
        PopupMenuItem(
          padding:
          EdgeInsets.symmetric(horizontal: 0.w),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: ListTile(
              onTap: () {
                Get.back();
                _blockUserController.blockUser(userId: userId);
              },
              title: CustomText(
                text: "block_account",
                fontSize: 16,
                color: kCBlackTitle,
                fontW: FW.semicond,
              ),
              leading: const ImageIcon(
                AssetImage(
                    "assets/icons/blockProfile.png"),
                color: kCMainBlack,
              ),
            ),
          ),
        ),
        PopupMenuItem(
          padding:
          EdgeInsets.symmetric(horizontal: 0.w),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: ListTile(
              onTap: () {
                Get.back();
                _reportUserController.reportUser(userId: userId);
              },
              title: CustomText(
                text: "report_",
                fontSize: 16,
                color: kCBlackTitle,
                fontW: FW.semicond,
              ),
              leading: const ImageIcon(
                AssetImage(
                    "assets/icons/reportProfile.png"),
                color: kCMainBlack,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
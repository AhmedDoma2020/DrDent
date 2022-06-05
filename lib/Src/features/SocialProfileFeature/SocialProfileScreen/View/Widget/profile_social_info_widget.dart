import 'package:dr_dent/Src/bloc/controller/follow_and_un_follow_controller.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/services/photo_view.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/follow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../Block/Controller/featch_social_profile_controller.dart';

class profileSocialInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FollowAndUnFollowController _followAndUnFollowController = Get.find();
    GetStorage box = GetStorage();
    return GetBuilder<FetchSocialProfileController>(
      builder: (_) => SizedBox(
        // height: 310.h,
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => PhotoViewWidget(
                            imageProvider:
                                NetworkImage(_.userProfileModel!.cover),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 192.h,
                        width: double.infinity,
                        child: ImageNetwork(
                          height: 192.h,
                          width: double.infinity,
                          url: _.userProfileModel!.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 40.h,
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: SizedBox(
                                height: 40.h,
                                width: 40.h,
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: 32.h,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          CustomText(
                            text: "personal_page".tr,
                            color: Colors.white,
                            fontW: FW.medium,
                            fontSize: 16,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: PopupMenuButton(
                              icon: Icon(Icons.more_vert, color: Colors.white, size: 28.h),
                              itemBuilder: (context) => <PopupMenuEntry>[
                                PopupMenuItem(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 0.w),
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: ListTile(
                                      onTap: () {
                                        Get.back();
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  // color: Colors.greenAccent,
                  // height: 115.h,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(right: 130.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        14.0.ESH(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              // color: Colors.greenAccent,
                              width: 120.w,
                              child: CustomText(
                                text: _.userProfileModel!.name,
                                fontW: FW.bold,
                                fontSize: 14,
                                overflow: true,
                                maxLines: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24.w),
                              child: FollowButton(
                                userId: _.userProfileModel!.id,
                                onTap: () {},
                                isFollow: _.userProfileModel!.isFollow,
                              ),
                            ),
                          ],
                        ),
                        8.0.ESH(),
                        SizedBox(
                          // color: Colors.greenAccent,
                          width: 220.w,
                          child: CustomText(
                            text: "_.specialization",
                            fontW: FW.semicond,
                            fontSize: 14,
                            overflow: true,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 160.h,
              right: 24.w,
              // left: 24.w,
              child: Container(
                height: 100.h,
                width: 100.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(777.r),
                    color: Colors.white),
                child: Container(
                  height: 98.h,
                  width: 98.h,
                  color: Colors.transparent,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(777.r),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            () => PhotoViewWidget(
                              imageProvider:
                                  NetworkImage(_.userProfileModel!.image),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 92.h,
                          width: 92.h,
                          child: ImageNetwork(
                            width: 92.h,
                            height: 92.h,
                            url: _.userProfileModel!.image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

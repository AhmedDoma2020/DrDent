import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_profile_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/View/follower_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/View/following_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_row_info_item.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/Block/Controller/featch_social_profile_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SocialProfileRowInfoAndRate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FetchSocialProfileController _fetchSocialProfileController = Get.find();
    GetStorage box = GetStorage();

    return GetBuilder<FetchSocialProfileController>(
      builder: (_) => Container(
        // color: Colors.red,
        height: 148.h,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: (box.read('lan') == "en")
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 130.w),
              child: Container(
                // color: Colors.greenAccent,
                constraints: BoxConstraints(
                  maxWidth: 220.w,
                ),
                child: CustomText(
                  text: _.userProfileModel!.userTypeId == 5 ||
                          _.userProfileModel!.userTypeId == 6
                      ? _.userProfileModel!.phone
                      : _.userProfileModel!.specializationsTitle,
                  fontW: FW.semicond,
                  fontSize: 14,
                  overflow: true,
                  maxLines: 1,
                ),
              ),
            ),
            8.0.ESH(),
            Padding(
              padding: EdgeInsets.only(right: 130.w),
              child: Row(
                mainAxisAlignment: (box.read('lan') == "en")
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < 5; i++)
                    Icon(
                      Icons.star,
                      color: i < (_.userProfileModel!.averageRate)
                          ? kCRateStareActive
                          : kCRateStareActive.withOpacity(0.30),
                      size: 24.h,
                    ),
                  4.0.ESW(),
                  CustomText(
                    text: "( ${_.userProfileModel!.averageRate} )",
                    fontSize: 10,
                    color: kCGreyTitle,
                  ),
                  12.0.ESW(),
                  CustomText(
                    text: "${"rate_".tr} ${_.userProfileModel!.rateNumber}",
                    fontSize: 10,
                    color: kCMain,
                  ),
                ],
              ),
            ),
            24.0.ESH(),
            _.userProfileModel!.userTypeId == 3 ||
                    _.userProfileModel!.userTypeId == 4
                ? SocialRowOfTAps3(
                    patientsNum: _.userProfileModel!.patients,
                    followingNum: _.userProfileModel!.followingsNumber,
                    followersNum: _.userProfileModel!.followersNumber,
                    id: _.userProfileModel!.id,
                  )
                : SocialRowOfTAps2(
                    id: _.userProfileModel!.id,
                    followersNum: _.userProfileModel!.followersNumber,
                    followingNum: _.userProfileModel!.followingsNumber,
                  )
          ],
        ),
      ),
    );
  }
}

class SocialRowOfTAps3 extends StatelessWidget {
  final int patientsNum;
  final int followersNum;
  final int followingNum;
  final int id;

  const SocialRowOfTAps3({
    required this.id,
    required this.patientsNum,
    required this.followersNum,
    required this.followingNum,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileRowInfoItem(
            icon: "assets/icons/pationtNimIcon.png",
            num: "$patientsNum",
            title: "patients_",
            onTap: () {},
          ),
          ProfileRowInfoItem(
            icon: "assets/icons/followingNumIcon.png",
            num: "$followingNum",
            title: "following_",
            onTap: () {
              Get.to(() => FollowingScreen(
                    userId: id,
                  ));
            },
          ),
          ProfileRowInfoItem(
            icon: "assets/icons/followersNumIcon.png",
            num: "$followersNum",
            title: "followers_",
            onTap: () {
              Get.to(() => FollowersScreen(
                    userId: id,
                  ));
            },
          ),
        ],
      ),
    );
  }
}

class SocialRowOfTAps2 extends StatelessWidget {
  final int followersNum;
  final int followingNum;
  final int id;

  const SocialRowOfTAps2({
    required this.id,
    required this.followersNum,
    required this.followingNum,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          0.0.ESW(),
          ProfileRowInfoItem(
            icon: "assets/icons/followingNumIcon.png",
            num: "$followingNum",
            title: "following_",
            onTap: () {
              Get.to(() => FollowingScreen(
                    userId: id,
                  ));
            },
          ),
          ProfileRowInfoItem(
            icon: "assets/icons/followersNumIcon.png",
            num: "$followersNum",
            title: "followers_",
            onTap: () {
              Get.to(() => FollowersScreen(
                    userId: id,
                  ));
            },
          ),
          0.0.ESW(),
        ],
      ),
    );
  }
}

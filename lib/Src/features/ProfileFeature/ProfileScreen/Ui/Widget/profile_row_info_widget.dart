import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_profile_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/View/following_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_row_info_item.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../View/follower_screen.dart';

class ProfileRowInfoAndRate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FetchProfileController _fetchProfileDoctorController = Get.find();
    GetStorage box = GetStorage();
    return GetBuilder<FetchProfileController>(
      builder: (_) =>
          SizedBox(
            // color: Colors.red,
            height: 128.h,
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 130.w),
                  child: Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Icon(
                          Icons.star,
                          color: i < (_.rateAverage ?? 0)
                              ? kCRateStareActive
                              : kCRateStareActive.withOpacity(0.30),
                          size: 24.h,
                        ),
                      4.0.ESW(),
                      CustomText(
                        text: "( ${_.rateAverage ?? 0} )",
                        fontSize: 10,
                        color: kCGreyTitle,
                      ),
                      12.0.ESW(),
                      CustomText(
                        text: "${"rate_".tr} ${_.rateNum ?? 0}",
                        fontSize: 10,
                        color: kCMain,
                      ),
                    ],
                  ),
                ),
                24.0.ESH(),
                box.read('user_type_id') == 3 ||
                    box.read('user_type_id') == 4
                    ? RowOfTAps3(
                  id:_.id!, followersNum:_.followersNum! , followingNum:_.followingNum!, patientsNum:_.patientsNum!,)
                    : RowOfTAps2(id:_.id! ,followersNum: _.followersNum!,followingNum: _.followingNum!,)
              ],
            ),
          ),
    );
  }
}

class RowOfTAps3 extends StatelessWidget {
  final int patientsNum;
  final int followersNum;
  final int followingNum;
  final int id;

  const RowOfTAps3({
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
            num: "$patientsNum ",
            title: "patients_",
            onTap: () {},
          ),
          ProfileRowInfoItem(
            icon: "assets/icons/followingNumIcon.png",
            num: "$followingNum",
            title: "following_",
            onTap: () {
              Get.to(() => FollowingScreen(userId: id,));
            },
          ),
          ProfileRowInfoItem(
            icon: "assets/icons/followersNumIcon.png",
            num: "$followersNum",
            title: "followers_",
            onTap: () {
              Get.to(() => FollowersScreen(userId: id,));
            },
          ),

        ],
      ),
    );
  }
}

class RowOfTAps2 extends StatelessWidget {
  final int followersNum;
  final int followingNum;
  final int id;

  const RowOfTAps2({
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
              Get.to(() => FollowingScreen(userId: id,));
            },
          ),
          ProfileRowInfoItem(
            icon: "assets/icons/followersNumIcon.png",
            num: "$followersNum",
            title: "followers_",
            onTap: () {
              Get.to(() => FollowersScreen(userId: id,));
            },
          ),
          0.0.ESW(),
        ],
      ),
    );
  }
}

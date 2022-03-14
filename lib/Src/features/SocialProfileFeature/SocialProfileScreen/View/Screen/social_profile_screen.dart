import 'package:dr_dent/Src/bloc/controller/follow_and_un_follow_controller.dart';
import 'package:dr_dent/Src/bloc/controller/navigation_routs_controller.dart';
import 'package:dr_dent/Src/core/services/photo_view.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/Block/Controller/featch_social_profile_controller.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/View/Widget/social_profile_row_info_and_rate.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/follow_button.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/pop_up_menu_of_report_and_block_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SocialProfileScreen extends StatelessWidget {
  final int userId;

  const SocialProfileScreen({required this.userId, Key? key}) : super(key: key);

  Widget buildSliverAppBar(
      {required String name,
      required String cover,
      required String avatar,
      required int id,
      required int isFollow}) {
    return SliverAppBar(
      expandedHeight: 200.h,
      pinned: true,
      stretch: true,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        PopUpMenuOfReportAndBlockProfile(
          userId: id,
        ),
      ],
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          width: 100.w,
          // color: Colors.red,
          child: CustomText(
            text: name,
            fontW: FW.semicond,
            textAlign: TextAlign.center,
            overflow: true,
            // fontSize: 20,
          ),
        ),
        titlePadding: EdgeInsets.only(
          // left: 126.w,
          right: 0.w,
          bottom: 18.h,
        ),
        background: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(
                  () => PhotoViewWidget(
                    imageProvider: NetworkImage(cover),
                  ),
                );
              },
              child: ImageNetwork(
                url: cover,
                height: 188.h,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0.h,
              left: 16.w,
              right: 16.w,
              child: Row(
                children: [
                  Container(
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
                                  imageProvider: NetworkImage(avatar),
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 92.h,
                              width: 92.h,
                              child: ImageNetwork(
                                width: 92.h,
                                height: 92.h,
                                url: avatar,
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
            Positioned(
              bottom: 18.h,
              left: 8.w,
              child: Center(
                child: FollowButton(
                  userId: id,
                  onTap: () {},
                  isFollow: isFollow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    debugPrint(
        "box.read('user_type_id') in profile is ${box.read('user_type_id')}");
    debugPrint("userId is $userId");
    Get.put(FollowAndUnFollowController());
    Get.put(FetchSocialProfileController(userId: userId));
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<FetchSocialProfileController>(
        builder: (_) => _.status == RequestStatus.loading
            ? Center(
                child: Loader(),
              )
            : CustomScrollView(
                slivers: [
                  buildSliverAppBar(
                    isFollow: _.userProfileModel!.isFollow,
                    id: _.userProfileModel!.id,
                    name: _.userProfileModel!.name,
                    avatar: _.userProfileModel!.image,
                    cover: _.userProfileModel!.cover,
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    SocialProfileRowInfoAndRate(),
                    socialProfileIOSTapBarType(
                        userTypeId: _.userProfileModel!.userTypeId,
                        userId: userId),
                  ])),
                ],
              ),
      ),
    );
  }
}

//
// @override
// Widget build(BuildContext context) {
//   GetStorage box = GetStorage();
//   debugPrint("box.read('user_type_id') in profile is ${box.read('user_type_id')}");
//   debugPrint("userId is $userId");
//   Get.put(FollowAndUnFollowController());
//   Get.put(FetchSocialProfileController(userId: userId));
//   return SafeArea(
//     child: Scaffold(
//       body: GetBuilder<FetchSocialProfileController>(
//         builder:(_) => _.status == RequestStatus.loading ? Center(child: Loader(),):
//         ListView(
//           children: [
//             profileSocialInfoWidget(),
//             8.0.ESH(),
//             SocialProfileRowInfoAndRate(),
//             socialProfileIOSTapBarType(userTypeId: _.userProfileModel!.userTypeId,userId: userId),
//           ],
//         ),
//       ),
//     ),
//   );
// }

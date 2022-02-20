import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/services/photo_view.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_profile_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/set_avatar_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/set_cover_controller.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/dialog_of_enter_years_of_experience.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class profileInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    SetAvatarController _setAvatarController = Get.put(SetAvatarController());
    SetCoverController _setCoverController = Get.put(SetCoverController());
    return GetBuilder<FetchProfileController>(
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
                        Get.to(() => PhotoViewWidget(
                              imageProvider: NetworkImage(_.cover!),
                            ));
                      },
                      child: SizedBox(
                        height: 192.h,
                        width: double.infinity,
                        child: ImageNetwork(
                          height: 192.h,
                          width: double.infinity,
                          url: _.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8.h,
                      left: 24.w,
                      child: InkWell(
                        onTap: () {
                          _setCoverController.getImage();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: ImageIcon(
                            const AssetImage("assets/icons/cameraIcon.png"),
                            size: 20.h,
                          ),
                          radius: 20.h,
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
                              onTap: (){
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
                                  )),
                            ),
                          ),
                          CustomText(text: "personal_page".tr,color: Colors.white,fontW: FW.medium,fontSize: 16,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: SizedBox(
                                height: 40.h,
                                width: 40.h,
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
                        SizedBox(
                            width: 200,
                            child: CustomText(
                              text: _.name,
                              fontW: FW.demi,
                              fontSize: 14,
                              overflow: true,
                              maxLines: 1,
                            )),
                        7.0.ESH(),
                        box.read('user_type_id') != 3
                            ? 22.0.ESH()
                            : Column(
                                children: [
                                  _.specialization == null
                                      ? SizedBox(
                                          width: 220.w,
                                          child: Row(
                                            children: [
                                              CustomText(
                                                text:
                                                    "three_is_no_specialty_yet"
                                                        .tr,
                                                fontW: FW.demi,
                                                fontSize: 14,
                                                overflow: true,
                                                maxLines: 1,
                                                color: kCGreyTitle,
                                              ),
                                              4.0.ESW(),
                                              GestureDetector(
                                                onTap: () {},
                                                child: SizedBox(
                                                  child: CustomText(
                                                    text: "add_specialty".tr,
                                                    fontW: FW.demi,
                                                    fontSize: 14,
                                                    overflow: true,
                                                    maxLines: 1,
                                                    color: kCMain,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox(
                                          width: 200,
                                          child: CustomText(
                                            text:
                                                "${"Specialization_".tr} ${_.specialization}",
                                            fontW: FW.demi,
                                            fontSize: 14,
                                            overflow: true,
                                            maxLines: 1,
                                            color: kCGreyTitle,
                                          ),
                                        ),
                                  8.0.ESH(),
                                  _.yearsOfExperience == null
                                      ? SizedBox(
                                          width: 220.w,
                                          child: FittedBox(
                                            child: Row(
                                              children: [
                                                CustomText(
                                                  text:
                                                      "No_years_of_experience_yet"
                                                          .tr,
                                                  fontW: FW.demi,
                                                  fontSize: 14,
                                                  overflow: true,
                                                  maxLines: 1,
                                                  color: kCGreyTitle,
                                                ),
                                                4.0.ESW(),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.dialog(
                                                      DialogOfEnterYearsOfExperience(),
                                                    );
                                                    // Get.bottomSheet(
                                                    //     YearOfGraduationButtonSheet(
                                                    //       onTap: (title){
                                                    //
                                                    //       },
                                                    //     ),
                                                    //     isScrollControlled: true);
                                                  },
                                                  child: SizedBox(
                                                    child: CustomText(
                                                      text:
                                                          "Enter_years_of_experience"
                                                              .tr,
                                                      fontW: FW.demi,
                                                      fontSize: 14,
                                                      overflow: true,
                                                      maxLines: 1,
                                                      color: kCMain,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : SizedBox(
                                          width: 200,
                                          child: CustomText(
                                            text:
                                                "${"years_of_experience".tr} ${_.yearsOfExperience}",
                                            fontW: FW.demi,
                                            fontSize: 14,
                                            overflow: true,
                                            maxLines: 1,
                                            color: kCGreyTitle,
                                          ),
                                        ),
                                ],
                              )
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
                height: 98.h,
                width: 98.h,
                color: Colors.transparent,
                child: Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(777.r),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => PhotoViewWidget(
                                  imageProvider: NetworkImage(_.avatar!),
                                ));
                          },
                          child: SizedBox(
                            height: 92.h,
                            width: 92.h,
                            child: ImageNetwork(
                              width: 92.h,
                              height: 92.h,
                              url: _.avatar,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: InkWell(
                          onTap: () {
                            debugPrint("a7AMED");
                            _setAvatarController.getImage();
                          },
                          child: CircleAvatar(
                            backgroundColor: kCMain,
                            child: ImageIcon(
                              const AssetImage("assets/icons/cameraIcon.png"),
                              color: Colors.white,
                              size: 16.h,
                            ),
                            radius: 16.h,
                          ),
                        ),
                      ),
                    ],
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

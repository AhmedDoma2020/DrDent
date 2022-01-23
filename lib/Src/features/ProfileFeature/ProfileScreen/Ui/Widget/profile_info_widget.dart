import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/screens/year_of_graduation_button_sheet.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_profile_controller.dart';
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
    return GetBuilder<FetchProfileController>(
      builder:(_) =>  SizedBox(
        height: 310.h,
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 192.h,
                  width: double.infinity,
                  child: ImageNetwork(
                    height: 192.h,
                    width: double.infinity,
                    url: _.cover,
                  ),
                ),
                SizedBox(
                  // color: Colors.greenAccent,
                  height: 115.h,
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
                              text: _.name ,
                              fontW: FW.demi,
                              fontSize: 14,
                              overflow: true,
                              maxLines: 1,
                            )),
                        7.0.ESH(),
                        _.specialization==null? SizedBox(
                          width: 220.w,
                          child: Row(
                            children: [
                              CustomText(
                                text: "three_is_no_specialty_yet".tr,
                                fontW: FW.demi,
                                fontSize: 14,
                                overflow: true,
                                maxLines: 1,
                                color: kCGreyTitle,
                              ),
                              4.0.ESW(),
                              GestureDetector(
                                onTap: (){

                                },
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
                        ):
                        SizedBox(
                            width: 200,
                            child: CustomText(
                              text: _.specialization,
                              fontW: FW.demi,
                              fontSize: 14,
                              overflow: true,
                              maxLines: 1,
                              color: kCGreyTitle,
                            ),),
                        8.0.ESH(),
                        _.yearsOfExperience == null
                            ? SizedBox(
                                width: 220.w,
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: "No_years_of_experience_yet".tr,
                                      fontW: FW.demi,
                                      fontSize: 14,
                                      overflow: true,
                                      maxLines: 1,
                                      color: kCGreyTitle,
                                    ),
                                    4.0.ESW(),
                                    GestureDetector(
                                      onTap: (){
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
                                          text: "Enter_years_of_experience".tr,
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
                                      "${_.yearsOfExperience} ${"years_of_experience".tr}",
                                  fontW: FW.demi,
                                  fontSize: 14,
                                  overflow: true,
                                  maxLines: 1,
                                  color: kCGreyTitle,
                                )),
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(777.r),
                    color: Colors.white),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(777.r),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

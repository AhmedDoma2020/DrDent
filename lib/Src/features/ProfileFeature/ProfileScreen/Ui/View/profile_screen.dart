import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_doctor_profile_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/global_services_widget.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_column_info_item.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_row_info_item.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    Get.put(FetchProfileDoctorController());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<FetchProfileDoctorController>(
          builder: (_) => Column(
            children: [
              SizedBox(
                height: 297.h,
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
                            url:
                                "https://images.pexels.com/photos/10436443/pexels-photo-10436443.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                          ),
                        ),
                        Container(
                          // color: Colors.greenAccent,
                          height: 105.h,
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
                                      text: box.read("name") ?? "Ahmed Doma",
                                      fontW: FW.demi,
                                      fontSize: 14,
                                      overflow: true,
                                      maxLines: 1,
                                    )),
                                7.0.ESH(),
                                SizedBox(
                                    width: 200,
                                    child: CustomText(
                                      text: box.read("specialization") ??
                                          "…تخصص الأسنان والتركيبات وتقويم ",
                                      fontW: FW.demi,
                                      fontSize: 14,
                                      overflow: true,
                                      maxLines: 1,
                                      color: kCGreyTitle,
                                    )),
                                8.0.ESH(),
                                SizedBox(
                                    width: 200,
                                    child: CustomText(
                                      text:
                                          "${box.read("years_of_experience") ?? "20"} ${"years_of_experience".tr}",
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
                                url: box.read("avatar") ??
                                    "https://images.pexels.com/photos/10436443/pexels-photo-10436443.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProfileRowInfoItem(
                            icon: "assets/icons/pationtNimIcon.png",
                            num: "${_.patientsNum ?? 0}",
                          ),
                          ProfileRowInfoItem(
                            icon: "assets/icons/followingNumIcon.png",
                            num: "${_.followersNum ?? 0}",
                          ),
                          ProfileRowInfoItem(
                            icon: "assets/icons/followersNumIcon.png",
                            num: "${_.followingNum ?? 0}",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // GlobalInformationDetailsWidget(),
              GlobalServicesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}


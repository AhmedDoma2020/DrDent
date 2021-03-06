import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/controller/job_offers_controller.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_offer.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/screens/enter_your_information_to_apply_job_button_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_tag.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '/src/core/utils/extensions.dart';
import '../../../../ui/widgets/GeneralWidgets/image_network.dart';

class JobScreen extends StatelessWidget {
  final JobOffer offer;
  final int index;

  const JobScreen({Key? key, required this.offer, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("offer.isApplied is ${offer.isApplied}");
    GetStorage box = GetStorage();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBars.appBarDefault(title: 'job_details'.tr),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: ListView(
              children: [
                16.0.ESH(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: 61.w,
                        height: 61.w,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: kCLightGrey.withOpacity(0.5)),
                        child: ImageNetwork(
                          url: offer.image,
                          width: 61.w,
                          height: 61.w,
                        ),
                      ),
                    ),
                    23.0.ESH(),
                    CustomText(
                      text: offer.name,
                      fontSize: 14,
                      color: kCMainBlack2,
                      fontW: FW.demi,
                    ),
                    9.0.ESH(),
                    CustomText(
                      text: offer.address,
                      fontSize: 11,
                      color: kCMainBlack2,
                      fontW: FW.semicond,
                    ),
                    7.0.ESH(),
                    CustomText(
                      text: offer.phone,
                      fontSize: 11,
                      color: kCMainBlack2,
                      fontW: FW.semicond,
                    ),
                    10.0.ESH(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CardTag(
                          title:
                              offer.jobTypeId == 0 ? 'Full_time' : 'part_time',
                        ),
                        24.0.ESW(),
                        CustomText(
                          text:
                              '${'from_'.tr} ${offer.startSalary} - ${offer.endSalary} ${'E_G_P'.tr}',
                          fontW: FW.demi,
                          fontSize: 14,
                          color: kCMainBlack2,
                        ),
                      ],
                    ),
                  ],
                ),
                24.0.ESH(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.r),
                      color: kCInContainerBackGround),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0.w, vertical: 15.0.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: 'job_description_',
                              color: kCMainBlack2,
                              fontW: FW.demi,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: CustomText(
                            text: offer.description,
                            color: kCMainBlack2,
                            fontW: FW.semicond,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                16.0.ESH(),
                offer.requirements.isNotEmpty
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            color: kCInContainerBackGround),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0.w, vertical: 15.0.h),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                    text: 'Job_requirements',
                                    color: kCMainBlack2,
                                    fontW: FW.demi,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 16.h),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: kCSubMain,
                                          radius: 4.w,
                                        ),
                                        10.0.ESW(),
                                        Expanded(
                                          child: CustomText(
                                            text: offer.requirements[index],
                                            color: kCMainBlack2,
                                            fontW: FW.semicond,
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                    separatorBuilder: (context, index) =>
                                        10.0.ESH(),
                                    itemCount: offer.requirements.length,
                                    physics: NeverScrollableScrollPhysics(),
                                  )),
                            ],
                          ),
                        ),
                      )
                    : 0.0.ESW(),
                100.0.ESH(),
              ],
            ),
          ),
          GetBuilder<JobOffersController>(
            builder: (_) => (box.read('user_type_id') == 7 &&
                    box.read('id') != offer.userId)
                ? _.jobOffers[index].isApplied == 0
                    ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0.h),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ButtonDefault(
                            height: 55,
                            title: 'Apply_for_a_job'.tr,
                            onTap: () {
                              Get.bottomSheet(
                                EnterYourInfoToApplyJopButtonSheet(
                                  offerId: offer.id,
                                ),
                                isScrollControlled: true,
                              );
                            },
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0.h),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ButtonDefault(
                            height: 55,
                            buttonColor: Colors.transparent,
                            titleColor: kCBlackTitle,
                            borderColor: kCActiveButton,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: 'Apply_for_a_job_successFly',
                                  fontW: FW.semicond,
                                ),
                                8.0.ESW(),
                                Container(
                                  height: 28.h,
                                  width: 28.h,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(777.r),
                                      color: kCMainGreen),
                                  child: Center(
                                      child: Icon(
                                    Icons.add_task_outlined,
                                    size: 20.h,
                                        color: Colors.white,
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                : 0.0.ESW(),
          )
        ],
      ),
    );
  }
}

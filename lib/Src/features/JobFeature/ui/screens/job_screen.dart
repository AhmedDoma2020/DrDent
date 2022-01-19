import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_offer.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_tag.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';

class JobScreen extends StatelessWidget {
  final JobOffer offer;
  const JobScreen({Key? key,required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBars.appBarDefault(title: 'تفاصيل الوظيفة'),
      body: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
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
                            color: Colors.red
                        ),
                      ),
                    ),
                    23.0.ESH(),
                    CustomText(
                      text: offer.ownerName,
                      fontSize: 14,
                      color: kCMainBlack2,
                      fontW: FW.demi,
                    ),
                    9.0.ESH(),
                    CustomText(
                      text: offer.ownerAddress,
                      fontSize: 11,
                      color: kCMainBlack2,
                      fontW: FW.semicond,
                    ),
                    7.0.ESH(),
                    CustomText(
                      text: offer.ownerPhone,
                      fontSize: 11,
                      color: kCMainBlack2,
                      fontW: FW.semicond,
                    ),
                    10.0.ESH(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        const CardTag(
                          title: 'دوام كامل',
                        ),
                        24.0.ESW(),
                        CustomText(
                          text: 'من ${offer.startPrice} - ${offer.endPrice} جنيه',
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
                      color: kCInContainerBackGround
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 16.0.w,
                        vertical: 15.0.h
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: 'وصف الوظيفة',
                              color: kCMainBlack2,
                              fontW: FW.demi,
                              fontSize: 14,
                            ),

                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.only(
                              top: 16.h
                          ),
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
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.r),
                      color: kCInContainerBackGround
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 16.0.w,
                        vertical: 15.0.h
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: 'متطلبات الوظيفة',
                              color: kCMainBlack2,
                              fontW: FW.demi,
                              fontSize: 14,
                            ),

                          ],
                        ),

                        Padding(
                            padding:  EdgeInsets.only(
                                top: 16.h
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: kCSubMain,
                                    radius: 4.w,
                                  ),
                                  10.0.ESW(),
                                  Expanded(
                                    child: CustomText(
                                      text: offer.requirments![index],
                                      color: kCMainBlack2,
                                      fontW: FW.semicond,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              separatorBuilder: (context, index) => 10.0.ESH(),
                              itemCount: offer.requirments!.length,
                              physics: NeverScrollableScrollPhysics(),
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                100.0.ESH(),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(
              vertical: 16.0.h
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ButtonDefault(
                height: 55,
                title: 'التقديم علي الوظيفة',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

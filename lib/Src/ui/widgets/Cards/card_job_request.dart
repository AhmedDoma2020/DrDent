import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';
import 'card_tag.dart';

class CardJobRequest extends StatelessWidget {
  final double width;
  final JobRequest request;
  const CardJobRequest({Key? key,this.width=343,required this.request}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 61.w,
                  height: 61.w,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.red
                  ),
                ),
                16.0.ESW(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: request.ownerName,
                        color: kCMainBlack2,
                        fontSize: 14,
                        fontW: FW.demi,
                      ),
                      5.0.ESH(),
                      CustomText(
                        text: 'اخصائية أسنان الأطفال وتقويمات والتركيبات الأسنان',
                        color: kCMainBlack2,
                        fontSize: 12,
                        fontW: FW.light,
                      ),
                      5.0.ESH(),
                      CustomText(
                        text: 'القسم تاني , شارع المطافي , برج الدالي , الدور 11',
                        color: kCMainGrey,
                        fontSize: 10,
                        fontW: FW.semicond,
                      ),
                      5.0.ESH(),
                      CustomText(
                        text: '+00 0000 0000',
                        color: kCMainGrey,
                        fontSize: 10,
                        fontW: FW.semicond,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            16.0.ESH(),
            ButtonDefault(
              title: 'عرض السيرة الزاتية',
              height: 46.h,
            )
          ],
        ),
      ),
    );
  }
}

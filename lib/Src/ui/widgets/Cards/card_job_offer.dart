import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/screens/job_screen.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';
import 'card_tag.dart';

class CardJobOffer extends StatelessWidget {
  const CardJobOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>JobScreen());
      },
      child: Container(
        width: 343.w,
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
                          text: 'نبحث عن أخصائي أسنان وتركيبات ثابتة',
                          color: kCMainBlack2,
                          fontSize: 14,
                          fontW: FW.medium,
                        ),
                        5.0.ESH(),
                        CustomText(
                          text: 'مركز وايتي دينتال لتجميل الأسنان',
                          color: kCActiveDot,
                          fontSize: 10,
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
              15.0.ESH(),
              Divider(),
              15.0.ESH(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                   const CardTag(
                    title: 'دوام كامل',
                  ),
                  CustomText(
                    text: 'من 6000 - 8000 جنيه',
                    fontW: FW.demi,
                    fontSize: 14,
                    color: kCMainBlack2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

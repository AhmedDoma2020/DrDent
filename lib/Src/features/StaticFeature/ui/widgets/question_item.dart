import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/StaticFeature/bloc/models/question.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';


class QuestionItem extends StatelessWidget {
  final Question question;
  const QuestionItem({Key? key,required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: question.question,
                  fontW: FW.medium,
                  fontSize: 14,
                  color: kCMainBlack2
                ),
                question.expanded?
                Icon(Icons.keyboard_arrow_up_outlined,color: kCMain):
                Icon(Icons.keyboard_arrow_down_outlined,color: kCMain),
              ],
            ),
            question.expanded?
            Padding(
              padding:  EdgeInsets.only(
                top: 19.h
              ),
              child: CustomText(
                  text: question.answer,
                  fontW: FW.semicond,
                  fontSize: 14,
                  color: kCMainGrey
              ),
            ):
            0.0.ESH()
          ],
        ),
      ),
    );
  }
}

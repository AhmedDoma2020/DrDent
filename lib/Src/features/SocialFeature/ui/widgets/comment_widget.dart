import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';

class CommentWidget extends StatelessWidget {
  final bool subComment;
  const CommentWidget({Key? key,this.subComment=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: subComment?0:16.0.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: !subComment ? 40.w : 25.w,
              height: !subComment ? 40.w : 25.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: ImageNetwork(
                width: 40.w,
                height: 40.w,
                url: 'https://images.pexels.com/photos/6149104/pexels-photo-6149104.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
              ),
            ),
            16.0.ESW(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  subComment?
                      0.0.ESW():
                  Row(
                    children: [
                      CustomText(
                        text: 'رشا السيد',
                        fontW: FW.demi,
                        fontSize: 16,
                        color: kCMainBlack2,
                      ),
                      2.0.ESH(),
                    ],
                  ),
                  CustomText(
                    text: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو ',
                    fontW: FW.semicond,
                    fontSize: 12,
                    color: kCMainBlack2,
                  ),
                  8.0.ESH(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap:(){

                        },
                        child: CustomText(
                          text: 'تعليق',
                          color: kCMainBlack2,
                          fontSize: 12,
                          fontW: FW.demi,
                        ),
                      ),
                      6.0.ESW(),
                      CircleAvatar(
                        radius: 2.w,
                        backgroundColor: kCMainGrey,
                      ),
                      6.0.ESW(),
                      GestureDetector(
                        onTap:(){

                        },
                        child: CustomText(
                          text: 'اعحبني',
                          color: kCMainBlack2,
                          fontSize: 12,
                          fontW: FW.demi,
                        ),
                      ),
                      6.0.ESW(),
                      CircleAvatar(
                        radius: 2.w,
                        backgroundColor: kCMainGrey,
                      ),
                      6.0.ESW(),
                      CustomText(
                        text: '12 يوم',
                        color: kCMainGrey,
                        fontSize: 12,
                        fontW: FW.demi,
                      ),
                    ],
                  ),
                  subComment?
                      0.0.ESH():
                  Padding(
                    padding:  EdgeInsets.only(
                      top: 10.0.h
                    ),
                    child: ListView.separated(
                        itemBuilder: (context, index) => CommentWidget(subComment: true,),
                        separatorBuilder: (context, index) => 10.0.ESH(),
                        itemCount: 2,
                        shrinkWrap: true,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

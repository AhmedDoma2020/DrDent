import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';
import 'card_tag.dart';



class CardVisit extends StatelessWidget {
  final double width;
  const CardVisit({Key? key,this.width=327}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185.h,
      width: width.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kNCardRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(
          vertical: 13.h
        ),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 16.w
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'السبت ,22مارس, الساعه 09:00 مساءا',
                    fontSize: 10,
                    color: kCBlackTitle,
                    fontW: FW.light,
                  ),
                  const CardTag(
                    title: 'كشف جديد',
                  ),
                ],
              ),
            ),
            7.5.ESH(),
            const Divider(),
            7.5.ESH(),
           Padding(
             padding:  EdgeInsets.symmetric(
                 horizontal: 16.w
             ),
             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     CustomText(
                       text: 'رشا السيد محمد',
                       fontSize: 14,
                       color: kCBlackTitle,
                       fontW: FW.demi,
                     ),
                     GestureDetector(
                       onTap: (){

                       },
                       child: CircleAvatar(
                         radius: 12.w,
                         backgroundColor: kCMainGrey.withOpacity(.3),
                         child:  Icon(Icons.error_outline,color: kCMainBlack2,size: 15.w,),
                       ),
                     ),
                   ],
                 ),
                 7.5.ESH(),
                 Row(
                   children: [
                     Image.asset(
                       'assets/icons/phone_icon.png',
                       height: 16.h,
                     ),
                     8.0.ESW(),
                     CustomText(
                       text: '0155 250 2454',
                       fontSize: 10,
                       color: kCMainBlack2,
                       fontW: FW.light,
                     ),
                   ],
                 ),
                 7.5.ESH(),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     ButtonDefault(title: 'تغيير الموعد',width: .4*width,height: 46,),
                     ButtonDefault(title: 'الغاء',width: .4*width,height: 46,buttonColor: Color(0xffEEF3FD),titleColor: kCMain,),
                   ],
                 ),
               ],
             ),
           ),
          ],
        ),
      ),
    );
  }
}

import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_tag.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({Key? key}) : super(key: key);

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
                      text: 'مركز وايتي دينتال لتجميل الأسنان',
                      fontSize: 14,
                      color: kCMainBlack2,
                      fontW: FW.demi,
                    ),
                    9.0.ESH(),
                    CustomText(
                      text: 'المنصورة , قسم تاني , شارع المطافي, برج الدالي , الدور 11',
                      fontSize: 11,
                      color: kCMainBlack2,
                      fontW: FW.semicond,
                    ),
                    7.0.ESH(),
                    CustomText(
                      text: '+00 0000 0000',
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
                          text: 'من 6000 - 8000 جنيه',
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
                            text: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. ذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.',
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
                                  CustomText(
                                    text: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس ',
                                    color: kCMainBlack2,
                                    fontW: FW.semicond,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                              separatorBuilder: (context, index) => 10.0.ESH(),
                              itemCount: 100,
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

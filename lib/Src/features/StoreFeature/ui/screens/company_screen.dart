import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';
import 'company_products_screen.dart';


class CompanyScreen extends StatelessWidget {
  const CompanyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'اسم الشركة'),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 300.h,
            child: ImageNetwork(
              width: double.infinity,
              height: 300.h,
              url: 'https://images.pexels.com/photos/139398/thermometer-headache-pain-pills-139398.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
            ),
          ),

          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 280.h,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24.r),
                      topLeft:  Radius.circular(24.r),

                    ),
                    color: Colors.white
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 16.0.w
                    ),
                    child: ListView(
                      children: [
                          16.0.ESH(),
                          CustomText(
                            text: 'شركة هيلثي كو للمنتجات الطبية ',
                            color: kCMainBlack2,
                            fontW: FW.demi,
                            fontSize: 18,
                          ),
                          8.0.ESH(),
                          CustomText(
                          text: '+00 0000 0000',
                          color: kCMainBlack2,
                          fontW: FW.medium,
                          fontSize: 14,
                        ),
                          8.0.ESH(),
                          Row(
                            children: [
                              for(int i=0 ; i<5 ; i++ )
                                  Icon(Icons.star,color: i<5 ? kCMainRate:kCMainRate.withOpacity(.6),size: 12.h,),
                              2.6.ESW(),
                              CustomText(
                                text: '(4.5)',
                                color: kCMainBlack2,
                                fontSize: 9,
                                fontW: FW.semicond,
                              ),
                              13.0.ESW(),
                              CustomText(
                                text: '13 تقييم',
                                color: kCActiveButton,
                                fontSize: 10,
                                fontW: FW.light,
                              ),
                            ],
                          ),
                        8.0.ESH(),
                        Divider(),
                        5.0.ESH(),
                        Row(
                          children: [
                            CustomText(
                              text: 'مفتوح الان',
                              fontW: FW.semicond,
                              fontSize: 12,
                              color: kCActiveButton,
                            ),
                          ],
                        ),
                        5.0.ESH(),
                        Divider(),
                        5.0.ESH(),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/location.png',
                              height: 16.h,
                            ),
                            10.0.ESW(),
                            CustomText(
                              text: 'المنصورة , قسم تاني , شارع المطافي, برج الدالي , الدور 11',
                              fontW: FW.medium,
                              fontSize: 12,
                              color: kCMainBlack2,
                            ),
                          ],
                        ),
                        9.0.ESH(),
                        CustomText(
                          text: 'تاريخ الشركة',
                          color: kCMainBlack2,
                          fontSize: 14,
                          fontW: FW.demi,
                        ),
                        9.0.ESH(),
                        CustomText(
                          text: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة ',
                          fontW: FW.medium,
                          fontSize: 12,
                          color: kCMainGrey,
                        ),
                        9.0.ESH(),
                        CustomText(
                          text: 'صور السجل التجاري والبطاقات الضريبية',
                          color: kCMainBlack2,
                          fontSize: 14,
                          fontW: FW.demi,
                        ),
                        9.0.ESH(),
                        SizedBox(
                          height: 93.h,
                          child: ListView.separated(
                              itemBuilder: (context, index) => Container(
                                height: 93.h,
                                width: 140.w,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: ImageNetwork(
                                  height: 93.h,
                                  width: 14.w,
                                  url: 'https://images.pexels.com/photos/139398/thermometer-headache-pain-pills-139398.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                                ),
                              ),
                              separatorBuilder: (context, index) => 16.0.ESW(),
                              itemCount: 30,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                          ),
                        ),
                        100.0.ESH(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(
                bottom: 16.0.h
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ButtonDefault(
                title: 'عرض منتجات الشركة',
                onTap: (){
                  Get.to(()=>CompanyProductsScreen());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

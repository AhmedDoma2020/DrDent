import 'package:dr_dent/Src/bloc/model/store.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/StoreFeature/ui/screens/company_screen.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';


class CardCompany extends StatelessWidget {
  final double width;
  final double height;
  final Store store;
  const CardCompany({Key? key,required this.store,this.width=151.5,this.height=169}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>CompanyScreen(store: store,));
      },
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white
        ),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 8.5.w,
                vertical: 8.h
              ),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ImageNetwork(
                    url: store.image,
                    width: width,
                    height: height/2,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 16.0.w
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: store.name,
                    fontSize: 14,
                    overflow: true,
                    fontW: FW.demi,
                    color: kCMainBlack2,
                    textAlign: TextAlign.start,
                  ),
                  3.0.ESH(),
                  Row(
                    children: [
                      for(int i=0 ; i<5 ; i++)
                        Icon(Icons.star,color: i<store.rate! ? kCMainRate:kCLightGrey,size: 8.w,),
                      4.5.ESW(),
                      CustomText(
                        text: '4',
                        fontSize: 10,
                        overflow: true,
                        fontW: FW.semicond,
                        color: kCLightGrey,
                      ),
                    ],
                  ),
                  3.0.ESH(),
                  Row(
                    children: [
                      CustomText(
                        text: store.address,
                        fontSize: 9,
                        overflow: true,
                        fontW: FW.thin,
                        color: kCMainGrey,
                      ),
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

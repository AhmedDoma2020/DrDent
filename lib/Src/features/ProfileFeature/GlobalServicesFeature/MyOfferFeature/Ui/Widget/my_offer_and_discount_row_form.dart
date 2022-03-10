import 'package:dr_dent/Src/bloc/model/offer_and_discount_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyOfferFeature/Ui/View/offer_profile_screen.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/delete_widget.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/icon_widget.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class MyOfferAndDiscountRow extends StatelessWidget {
  final OfferAndDiscountModel offerAndDiscount;
  final VoidCallback onDeleteTap;
  final VoidCallback onEditTap;
   MyOfferAndDiscountRow({
    required this.offerAndDiscount,
    required this.onDeleteTap,
    required this.onEditTap,
    Key? key,
  }) : super(key: key);

  List<String> servicesList=[];

  @override
  Widget build(BuildContext context) {
    String getServicesTitle(){
      String servicesTitle='';
      for(var item in offerAndDiscount.services){
        servicesList.add(item.title);
      }
      servicesTitle = servicesList.join(",");
      return servicesTitle;
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: GestureDetector(
        onTap: (){
          Get.to(()=>OfferProfileScreen(offerAndDiscount: offerAndDiscount,getServicesTitle:getServicesTitle() ,));
        },
        child: Container(
          height: 300.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: kCOffWight,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 138.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 138.h,
                        child: ImageNetwork(
                            url: offerAndDiscount.image,
                            width: double.infinity,
                            height: 138.h),
                      ),
                      // Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Container(
                      //     height: 20.h,
                      //     width: 56.w,
                      //     decoration: BoxDecoration(
                      //       borderRadius:
                      //           BorderRadius.only(topRight: Radius.circular(8.r)),
                      //       color:  0 == 0
                      //           ? kCSubMain:kCMain,
                      //     ),
                      //     child: Center(
                      //       child: CustomText(
                      //         text: 0 == 0
                      //             ? "waited_".tr
                      //             : "accept_".tr,
                      //         fontW: FW.light,
                      //         fontSize: 9,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                // color: Colors.yellow,
                height: 158.h,
                child: Stack(
                  children: [
                    SizedBox(
                      width: 222.w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              constraints: BoxConstraints(maxWidth: 222.w),
                              // color: Colors.greenAccent,
                              child: CustomText(
                                text: getServicesTitle(),
                                fontW: FW.light,
                                fontSize: 10,
                                overflow: true,
                                maxLines: 1,
                                color: kCMainGrey,
                              ),
                            ),
                            8.0.ESH(),
                            Container(
                              constraints: BoxConstraints(maxWidth: 222.w),
                              // color: Colors.greenAccent,
                              child: CustomText(
                                text: offerAndDiscount.title,
                                fontW: FW.demi,
                                fontSize: 14,
                                overflow: true,
                                maxLines: 1,
                              ),
                            ),
                            4.0.ESH(),
                            Container(
                              constraints: BoxConstraints(maxWidth: 222.w),
                              // color: Colors.greenAccent,
                              child: CustomText(
                                text: offerAndDiscount.bookingInfo,
                                fontW: FW.light,
                                fontSize: 10,
                                overflow: true,
                                maxLines: 1,
                                color: kCMainGrey,
                              ),
                            ),
                            4.0.ESH(),
                            Container(
                              constraints: BoxConstraints(maxWidth: 222.w),
                              // color: Colors.greenAccent,
                              child: CustomText(
                                text: offerAndDiscount.offerInfo,
                                fontW: FW.light,
                                fontSize: 10,
                                overflow: true,
                                maxLines: 1,
                                color: kCMainGrey,
                              ),
                            ),
                            4.0.ESH(),
                            Container(
                              constraints: BoxConstraints(maxWidth: 222.w),
                              // color: Colors.greenAccent,
                              child: Row(
                                children: [
                                  offerAndDiscount.priceAfterOffer == offerAndDiscount.price?0.0.ESW() :
                                  SizedBox(
                                    height: 19.h,
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: CustomText(
                                            text: offerAndDiscount.price,
                                            fontW: FW.demi,
                                            fontSize: 16,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            color: kCMainGrey,
                                            height: 1.h,
                                            width: 24.w,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  8.0.ESW(),
                                  CustomText(
                                    text: offerAndDiscount.priceAfterOffer,
                                    fontW: FW.demi,
                                    fontSize: 16,
                                    color: kCMain,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 34.w,
                          child: Row(
                            children: [
                              // EditWidget(onEditTap: onEditTap),
                              DeleteWidget(onDeleteTap: onDeleteTap),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

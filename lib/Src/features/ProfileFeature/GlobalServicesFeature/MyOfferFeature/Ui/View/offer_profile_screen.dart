import 'package:dr_dent/Src/bloc/model/offer_and_discount_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class OfferProfileScreen extends StatelessWidget {
  final OfferAndDiscountModel offerAndDiscount;
  // final String getServicesTitle;
  const OfferProfileScreen({
    required this.offerAndDiscount,
    // required this.getServicesTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 355.h,
              child: ImageNetwork(
                url: offerAndDiscount.image,
                height: 355.h,
                width: double.infinity,
              ),
            ),
            Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    340.0.ESH(),
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(24.r),topRight: Radius.circular(24.r)),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
                        width: double.infinity,
                        // color: Colors.yellow,
                        // height:300.h,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // width: 260.w,
                              constraints: BoxConstraints(maxWidth: 260.w),
                              // color: Colors.greenAccent,
                              child: CustomText(
                                text: offerAndDiscount.title,
                                fontW: FW.demi,
                                fontSize: 14,
                              ),
                            ),
                            8.0.ESH(),
                            Container(
                              constraints: BoxConstraints(maxWidth: 260.w),
                              // color: Colors.greenAccent,
                              child: CustomText(
                                text: offerAndDiscount.servicesTitle,
                                fontW: FW.light,
                                fontSize: 10,
                                color: kCMainGrey,
                              ),
                            ),
                            8.0.ESH(),
                            Container(
                              constraints: BoxConstraints(maxWidth: 260.w),
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
                            8.0.ESH(),
                            Row(
                              children: [
                                Icon(Icons.error_outline,color: kCBlackTitle,size: 20.h,),
                                8.0.ESW(),
                                CustomText(
                                  text: "${"duration_offer".tr}${offerAndDiscount.endDate}",
                                  fontW: FW.demi,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                            24.0.ESH(),
                            CustomText(
                              text: "offer_details".tr,
                              fontW: FW.demi,
                              fontSize: 16,
                              textAlign: TextAlign.center,
                            ),
                            16.0.ESH(),
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 300.w,
                              ),
                              child: CustomText(
                                text: offerAndDiscount.offerInfo,
                                fontW: FW.semicond,
                                fontSize: 12,
                                color: kCMainGrey,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            24.0.ESH(),
                            CustomText(
                              text: "booking_details".tr,
                              fontW: FW.demi,
                              fontSize: 16,
                              textAlign: TextAlign.center,
                            ),
                            16.0.ESH(),
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 300.w,
                              ),
                              child: CustomText(
                                text: offerAndDiscount.bookingInfo,
                                fontW: FW.semicond,
                                fontSize: 12,
                                color: kCMainGrey,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

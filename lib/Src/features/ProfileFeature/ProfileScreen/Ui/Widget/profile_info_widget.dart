
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/icon_form.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class profileInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return SizedBox(
      height: 297.h,
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 192.h,
                width: double.infinity,
                child: ImageNetwork(
                  height: 192.h,
                  width: double.infinity,
                  url:
                  "https://images.pexels.com/photos/10436443/pexels-photo-10436443.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                ),
              ),
              SizedBox(
                // color: Colors.greenAccent,
                height: 105.h,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(right: 130.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      14.0.ESH(),
                      SizedBox(
                          width: 200,
                          child: CustomText(
                            text: box.read("name") ?? "Ahmed Doma",
                            fontW: FW.demi,
                            fontSize: 14,
                            overflow: true,
                            maxLines: 1,
                          )),
                      7.0.ESH(),
                      SizedBox(
                          width: 200,
                          child: CustomText(
                            text: box.read("specialization") ??
                                "…تخصص الأسنان والتركيبات وتقويم ",
                            fontW: FW.demi,
                            fontSize: 14,
                            overflow: true,
                            maxLines: 1,
                            color: kCGreyTitle,
                          )),
                      8.0.ESH(),
                      SizedBox(
                          width: 200,
                          child: CustomText(
                            text:
                            "${box.read("years_of_experience") ?? "20"} ${"years_of_experience".tr}",
                            fontW: FW.demi,
                            fontSize: 14,
                            overflow: true,
                            maxLines: 1,
                            color: kCGreyTitle,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 160.h,
            right: 24.w,
            // left: 24.w,
            child: Container(
              height: 98.h,
              width: 98.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(777.r),
                  color: Colors.white),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(777.r),
                  child: SizedBox(
                    height: 92.h,
                    width: 92.h,
                    child: ImageNetwork(
                      width: 92.h,
                      height: 92.h,
                      url: box.read("avatar") ??
                          "https://images.pexels.com/photos/10436443/pexels-photo-10436443.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
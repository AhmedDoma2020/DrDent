import 'package:dr_dent/Src/bloc/model/user_service_model.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class UserServicesItem extends StatelessWidget {
  final UserServiceModel userServiceModel;

  const UserServicesItem({
    required this.userServiceModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: 104.h,
        width: 159.w,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 140.w,
              child: CustomText(
                text: userServiceModel.serviceTitle,
                fontW: FW.semicond,
                textAlign: TextAlign.center,
                overflow: true,
              ),
            ),
            8.0.ESH(),
            SizedBox(
              width: 140.w,
              child: CustomText(
                  text:
                  "${'Detection_price'.tr} ${":"} ${userServiceModel.price}",
                  textAlign: TextAlign.center,
                  overflow: true),
            ),
            8.0.ESH(),
            SizedBox(
              width: 140.w,
              child: CustomText(
                  text:
                  "${'Waiting_time'.tr} : ${userServiceModel.waitingTime}",
                  textAlign: TextAlign.center,
                  overflow: true),
            ),
          ],
        ),
      ),
    );
  }
}

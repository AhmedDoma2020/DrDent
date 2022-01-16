import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/set_work_license_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SetBusinessLicenseScreen extends StatefulWidget {
  @override
  State<SetBusinessLicenseScreen> createState() => _SetBusinessLicenseScreenState();
}
class _SetBusinessLicenseScreenState extends State<SetBusinessLicenseScreen> {
  @override
  Widget build(BuildContext context) {
    SetWorkLicenseController _setWorkLicenseController = Get.put(SetWorkLicenseController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBars.appBarDefault(title: "business_license".tr, isBack: false),
        backgroundColor: Colors.white,
        body: GetBuilder<SetWorkLicenseController>(
          builder:(_) =>  SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "business_license".tr,
                        fontSize: 18,
                        fontW: FW.semibold,
                      ),
                      16.0.ESH(),
                      CustomText(
                        text: "business_license_sup_title".tr,
                        fontSize: 16,
                        fontW: FW.semibold,
                        color: kCGreyTitle,
                      ),
                      62.0.ESH(),
                      Container(
                        width: double.infinity,
                        height: 188.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kCSubMain,
                            width: 1.w,
                          ),
                        ),
                        child: _.image != null
                            ? Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           PhotoViewWidget(
                                      //             imageProvider: AssetImage(),
                                      //           ),
                                      //     ));
                                    },
                                    child: Image.file(
                                      _.image!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 188.h,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.h, left: 8.w),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _.image = null;
                                            _.img64 = null;
                                          });
                                        },
                                        child: Container(
                                          height: 24.w,
                                          width: 24.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(777.r),
                                            color: Colors.grey.withOpacity(0.5),
                                          ),
                                          child: Icon(
                                            Icons.clear,
                                            color: Colors.white,
                                            size: 16.w,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 24.w,
                                    width: 24.w,
                                    child: Image.asset(
                                      "assets/icons/uplode.png",
                                      height: 24.w,
                                      width: 24.w,
                                    ),
                                  ),
                                  24.0.ESH(),
                                  ButtonDefault(
                                    width: 125,
                                    height: 48,
                                    buttonColor: kCSubMain,
                                    title: 'uplode_'.tr,
                                    radius: 4,
                                    titleColor: Colors.white,
                                    onTap: () {
                                      _.getImage();
                                    },
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                  _.img64 == null
                      ? 0.0.ESH()
                      : ButtonDefault(
                          title: 'save_contain'.tr,
                          onTap: () {
                            // Get.to(() => WattingScreen());
                            _.submit();
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

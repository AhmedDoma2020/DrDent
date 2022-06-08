import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/PackagesFeature/bloc/controller/package_controller.dart';
import 'package:dr_dent/Src/features/PackagesFeature/ui/widgets/package_widget.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';


class PackagesScreen extends StatelessWidget {
  const PackagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PackageController());
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'Payment_Packages'.tr),
      backgroundColor: Colors.white,
      body: GetBuilder<PackageController>(
        builder: (_) =>  Column(
          children: [
            24.0.ESH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40.h,
                  width:  300.w,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: kCMainScaffoldGrey
                  ),
                  child: Row(
                    children: [
                      for(int i = 0 ; i < 4 ; i++)
                        Expanded(
                          child: GestureDetector(
                            onTap: (){},
                            child: Container(
                              height: 40.h,
                              color: i == 0 ? kCSubMain:Colors.transparent,
                              child: Center(
                                child: CustomText(
                                  text: [
                                    'Month_'.tr,
                                    '3_Month'.tr,
                                    '6_Month'.tr,
                                    'year_'.tr
                                  ][i],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

              ],
            ),
            24.0.ESH(),
            Expanded(
              child: PageView.builder(
                controller: _.pageController,
                itemBuilder: (context, index) => Center(child: PackageWidget(),),
                itemCount: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dr_dent/Src/features/OnBoardingFeature/ui/widgets/on_boarding_footer.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:dr_dent/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/src/core/constants/color_constants.dart';
import '/src/features/OnBoardingFeature/ui/bloc/on_boarding_controller.dart';
import '/src/features/OnBoardingFeature/ui/widgets/on_boarding_body.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        Get.put(OnBoardingController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<OnBoardingController>(
        builder: (_) => Stack(
          children: [
            SizedBox(
              height: 600.h,
              child: PageView(
                controller: _.pageController,
                children: _.boards.map((
                    e) {
                  return OnBoardingBody(onBoardingItem: e);
                }).toList(),
                onPageChanged: (int index) {
                  _.changeBoardIndex(index);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 200.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: OnBoardingFooter(
                  index: _.boardIndex,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ButtonDefault(
                      title: 'next_'.tr,
                      onTap: () {
                        debugPrint("next>>>>>>>>>");
                        _.onNext();
                      },
                    ),
                    16.0.ESH(),
                    ButtonDefault(
                      buttonColor: kCDisActiveButton.withOpacity(0.08),
                      title: 'Join_us_now'.tr,
                      titleColor: kCMain,
                      disActiveBorderColor: kCMain.withOpacity(0.08),
                      onTap: () {
                        _.onStartButton();
                      },
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

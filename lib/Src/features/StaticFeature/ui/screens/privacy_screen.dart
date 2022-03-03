import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../bloc/controllers/privacy_controller.dart';
import '/src/core/utils/extensions.dart';

class PrivacyScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(PrivacyController());
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'سياسة الخصوصية'),
      body: GetBuilder<PrivacyController>(
        assignId: true,
        builder: (_) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.0.ESH(),
                CustomText(
                  text: 'سياسة الخصوصية',
                  color: kCMainBlack2,
                  fontSize: 18,
                  fontW: FW.demi,
                ),
                10.0.ESH(),
                _.status != RequestStatus.done?
                    Center(child: Loader(),):
                Expanded(child: ListView(children: [
                  CustomText(
                    text: _.content,
                    color: kCMainGrey,
                    fontSize: 14,
                    fontW: FW.semicond,
                  ),
                ],))
              ],
            ),
          );
        },
      ),
    );
  }
}

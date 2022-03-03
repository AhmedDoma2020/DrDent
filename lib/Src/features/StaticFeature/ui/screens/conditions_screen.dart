import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/request_status.dart';
import '../../../../ui/widgets/Dialog/loading_dialog.dart';
import '../../bloc/controllers/conditions_controller.dart';
import '/src/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ConditionsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(ConditionsController());
    return Scaffold(
      appBar: AppBars.appBarDefault(title: ' '),
      body: GetBuilder<ConditionsController>(
        assignId: true,
        builder: (_) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.0.ESH(),
                CustomText(
                  text: 'الشروط والاحكام',
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

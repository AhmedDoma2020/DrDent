import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/row_top_bottom_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';
import 'package:get/get.dart';
class SheetAddDayDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return  Material(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(19.r),
        topRight: Radius.circular(19.r),
      ),
      child: Container(
        width: double.infinity,
        height: 340.h,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(19.r),
              topRight: Radius.circular(19.r),
            ),
            color: Colors.white),
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 16.0.w
            ),
            child: Form(
              // key: _.globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  24.0.ESH(),
                  RowTopBottomSheet(title: "enter_work_time".tr),
                  32.0.ESH(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: TextFieldDefault(
                          hint: 'start_time'.tr,
                          // controller: _.buildNumController,
                          fieldType: FieldType.WithOutBorder,
                          enableBorder: Colors.transparent,
                          horizentalPadding: 0,
                          prefixIconUrl: 'start',
                          enable: false,
                          onComplete: () {
                            node.nextFocus();
                          },
                        ),
                      ),
                      SizedBox(
                        width: 150.w,
                        child: TextFieldDefault(
                          hint: 'end_time'.tr,
                          // controller: _.buildNumController,
                          enable: false,
                          fieldType: FieldType.WithOutBorder,
                          enableBorder: Colors.transparent,
                          horizentalPadding: 0,
                          prefixIconUrl: 'end',
                          onComplete: () {
                            node.nextFocus();
                          },
                        ),
                      ),
                    ],
                  ),
                  23.0.ESH(),
                  TextFieldDefault(
                    hint: 'number_of_visits'.tr,
                    // controller: _.buildNumController,
                    keyboardType: TextInputType.number,
                    fieldType: FieldType.WithOutBorder,
                    enableBorder: Colors.transparent,
                    horizentalPadding: 0,
                    prefixIconUrl: 'group',
                    onComplete: () {
                      node.unfocus();
                    },
                  ),
                  23.0.ESH(),
                  ButtonDefault(
                    title: 'save_'.tr,
                    onTap: () {
                      // _.submit();
                    },
                  ),
                  22.0.ESH(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/controller/work_time_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/row_top_bottom_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/src/core/utils/extensions.dart';

class SheetAddDayDetails extends StatefulWidget {
  final Function(String, String, String) onSave;
  final UserTypeEnum userType;

  SheetAddDayDetails({
    required this.onSave,
      required this.userType,
  });

  @override
  State<SheetAddDayDetails> createState() => _SheetAddDayDetailsState();
}

class _SheetAddDayDetailsState extends State<SheetAddDayDetails> {
  TextEditingController? startDateController;
  TextEditingController? endDateController;
  TextEditingController? visitsCountController;

  String? _selectedTime;

  Future<void> _show(
      {required BuildContext context, required Function(String?) onOk}) async {
    final TimeOfDay? result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (result != null) {
      onOk('${result.hour}:${result.minute}');
    } else {
      onOk(null);
    }
  }

  @override
  void initState() {
    super.initState();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
    visitsCountController = TextEditingController();
  }

  @override
  void dispose() {
    startDateController!.dispose();
    endDateController!.dispose();
    visitsCountController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(" widget.userType in SheetAddDayDetails is ${widget.userType}");
    var node = FocusScope.of(context);
    return Material(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(19.r),
        topRight: Radius.circular(19.r),
      ),
      child: Container(
        width: double.infinity,
        height: widget.userType != UserTypeEnum.doctor && widget.userType != UserTypeEnum.centerDoctor ? 260.h:340.h,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(19.r),
              topRight: Radius.circular(19.r),
            ),
            color: Colors.white),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
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
                      GestureDetector(
                        onTap: () {
                          _show(
                              context: context,
                              onOk: (value) {
                                debugPrint(value);
                                if (value != null) {
                                  setState(() {
                                    startDateController!.text = value;
                                  });
                                }
                              });
                        },
                        child: SizedBox(
                          width: 150.w,
                          child: TextFieldDefault(
                            hint: 'start_time'.tr,
                            controller: startDateController,
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
                      ),
                      GestureDetector(
                        onTap: () {
                          _show(
                              context: context,
                              onOk: (value) {
                                debugPrint(value);
                                if (value != null) {
                                  setState(() {
                                    endDateController!.text = value;
                                  });
                                }
                              });
                        },
                        child: SizedBox(
                          width: 150.w,
                          child: TextFieldDefault(
                            hint: 'end_time'.tr,
                            controller: endDateController,
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
                      ),
                    ],
                  ),
                  widget.userType != UserTypeEnum.doctor && widget.userType != UserTypeEnum.centerDoctor
                      ? 16.0.ESH()
                      : Column(
                          children: [
                            23.0.ESH(),
                            TextFieldDefault(
                              hint: 'number_of_visits'.tr,
                              controller: visitsCountController,
                              keyboardType: TextInputType.number,
                              fieldType: FieldType.WithOutBorder,
                              enableBorder: Colors.transparent,
                              horizentalPadding: 0,
                              prefixIconUrl: 'group',
                              onComplete: () {
                                node.unfocus();
                              },
                            ),
                          ],
                        ),
                  23.0.ESH(),
                  ButtonDefault(
                    title: 'save_'.tr,
                    onTap: () {
                      // _.submit();
                      widget.onSave(startDateController!.text,
                          endDateController!.text, visitsCountController!.text);
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

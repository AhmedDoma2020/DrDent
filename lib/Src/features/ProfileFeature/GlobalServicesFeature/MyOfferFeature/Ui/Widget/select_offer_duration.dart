import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyOfferFeature/Bloc/Controller/set_offer_and_discount_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class SelectOfferDurationRow extends StatefulWidget {
  final FocusScopeNode node;
  final TextEditingController offerDurationController;

  const SelectOfferDurationRow({
    Key? key,
    required this.node,
    required this.offerDurationController,
  }) : super(key: key);

  @override
  State<SelectOfferDurationRow> createState() => _SelectOfferDurationRowState();
}
class _SelectOfferDurationRowState extends State<SelectOfferDurationRow> {
  @override
  Widget build(BuildContext context) {
    const String dateFormat = "y-MM-dd";
    String _selectedDate = '';
    String _dateCount = '';
    String _range =
        "${DateFormat(dateFormat).format(DateTime.now())} ${"To_".tr} ${DateFormat(dateFormat).format(DateTime.now().add(const Duration(days: 7)))}";
    String _rangeCount = '';
    String _startDate = DateFormat(dateFormat).format(DateTime.now());
    DateTime _startDateTime = DateTime.now();
    String _endDate = DateFormat(dateFormat).format(DateTime.now().add(const Duration(days: 7)));
    DateTime _endDateTime = DateTime.now().add(const Duration(days: 7));
    void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
      setState(() {
        if (args.value is PickerDateRange) {
          _range =
          '${DateFormat(dateFormat).format(args.value.startDate)} ${"To_".tr} ${DateFormat(dateFormat).format(args.value.endDate ?? args.value.startDate)}';
          _startDate = DateFormat(dateFormat).format(args.value.startDate);
          _startDateTime = args.value.startDate;
          // _startDateTime2 = _startDateTime;
          // dateRangePickerController.selectedRange!.startDate=args.value.startDate;
          // dateRangePickerController.selectedRange!.endDate=args.value.endDate;
          _endDate = DateFormat(dateFormat)
              .format(args.value.endDate ?? args.value.startDate);
          _endDateTime = args.value.endDate ?? args.value.startDate;
          // _endDateTime2 = _endDateTime;
        } else if (args.value is DateTime) {
          _selectedDate = args.value.toString();
        } else if (args.value is List<DateTime>) {
          _dateCount = args.value.length.toString();
        } else {
          _rangeCount = args.value.length.toString();
        }
      });
    }

    return  GetBuilder<SetOfferAndDiscountController>(
      builder: (_) =>Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.dialog(
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      width: 327.w,
                      height: 350.h,
                      child: SfDateRangePicker(
                        endRangeSelectionColor: kCSubMain,
                        startRangeSelectionColor: kCSubMain,
                        rangeSelectionColor: kCSubMain.withOpacity(0.12),
                        // controller: dateRangePickerController,
                        // initialSelectedRanges: [PickerDateRange(_endDateTime,_startDateTime)],
                        // initialSelectedDate:_startDateTime,
                        onCancel: () {
                          Get.back();
                        },
                        onSubmit: (val) {
                          _.offerDurationController!.text = _range;
                          _.setStartOfferDuration = _startDate;
                          _.setEndOfferDuration = _endDate;
                          _.setDurationNum = _endDateTime.difference(_startDateTime).inDays +1;
                          debugPrint("_.setDurationNum ${_.durationNum}");
                          debugPrint("_startDate $_startDate");
                          debugPrint("_startDateTime $_startDateTime");
                          debugPrint("_endDate $_endDate");
                          debugPrint("_endDateTime $_endDateTime");
                          Get.back();
                        },
                        showActionButtons: true,
                        onSelectionChanged: _onSelectionChanged,
                        selectionMode: DateRangePickerSelectionMode.range,
                        initialSelectedRange: PickerDateRange(
                          _startDateTime,
                          _endDateTime,
                        ),
                        // initialDisplayDate: DateTime.now(),

                      ),
                    ),
                  ),
                );
              },
              child: TextFieldDefault(
                hint: 'set_offer_duration'.tr,
                errorText: "error_set_offer_duration".tr,
                controller: widget.offerDurationController,
                enable: false,
                disableBorder: Colors.transparent,
                keyboardType: TextInputType.phone,
                filledColor: kCBGTextFormFiled,
                fieldType: FieldType.WithBorder,
                enableBorder: Colors.transparent,
                horizentalPadding: 16,
                onComplete: () {
                  widget.node.nextFocus();
                },
              ),
            ),
          ),
          16.0.ESW(),
          Container(
            height: 68.h,
            width: 68.h,
            decoration: BoxDecoration(
              color: kCBGTextFormFiled,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
                child: CustomText(
                  text: " ${_.durationNum} ${"Day_".tr}",
                  fontSize: 12,
                  fontW: FW.semibold,
                  color: kCSubMain,
                )),
          ),

        ],
      ),
    );
  }
}

//
// class SelectOfferDurationWidget extends StatefulWidget {
//   // final Function onOk;
//   const SelectOfferDurationWidget({
//     // required this.onOk,
//     Key? key,
//   }) : super(key: key);
//   @override
//   State<SelectOfferDurationWidget> createState() =>
//       _SelectOfferDurationWidgetState();
// }
// class _SelectOfferDurationWidgetState extends State<SelectOfferDurationWidget> {
//   @override
//   Widget build(BuildContext context) {
//     const String dateFormat = "y-MM-dd";
//     String _selectedDate = '';
//     String _dateCount = '';
//     String _range =
//         "${DateFormat(dateFormat).format(DateTime.now())} ${"To_".tr} ${DateFormat(dateFormat).format(DateTime.now().add(const Duration(days: 7)))}";
//     String _rangeCount = '';
//     // DateRangePickerSelectionChangedArgs argsIns = DateRangePickerSelectionChangedArgs(DateTime.now());
//     String _startDate = DateFormat(dateFormat).format(DateTime.now());
//     DateTime _startDateTime = DateTime.now();
//     // DateTime _startDateTime2 = DateTime.now();
//     String _endDate = DateFormat(dateFormat).format(DateTime.now().add(const Duration(days: 7)));
//     DateTime _endDateTime = DateTime.now().add(const Duration(days: 7));
//     // DateTime _endDateTime2 = DateTime.now().add(const Duration(days: 7));
//     // DateRangePickerController? dateRangePickerController  = DateRangePickerController();
//     void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
//       /// The argument value will return the changed date as [DateTime] when the
//       /// widget [SfDateRangeSelectionMode] set as single.
//       ///
//       /// The argument value will return the changed dates as [List<DateTime>]
//       /// when the widget [SfDateRangeSelectionMode] set as multiple.
//       ///
//       /// The argument value will return the changed range as [PickerDateRange]
//       /// when the widget [SfDateRangeSelectionMode] set as range.
//       ///
//       /// The argument value will return the changed ranges as
//       /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
//       /// multi range.
//       setState(() {
//         if (args.value is PickerDateRange) {
//           _range =
//               '${DateFormat(dateFormat).format(args.value.startDate)} ${"To_".tr} ${DateFormat(dateFormat).format(args.value.endDate ?? args.value.startDate)}';
//           _startDate = DateFormat(dateFormat).format(args.value.startDate);
//           _startDateTime = args.value.startDate;
//           // _startDateTime2 = _startDateTime;
//           // dateRangePickerController.selectedRange!.startDate=args.value.startDate;
//           // dateRangePickerController.selectedRange!.endDate=args.value.endDate;
//           _endDate = DateFormat(dateFormat)
//               .format(args.value.endDate ?? args.value.startDate);
//           _endDateTime = args.value.endDate ?? args.value.startDate;
//           // _endDateTime2 = _endDateTime;
//         } else if (args.value is DateTime) {
//           _selectedDate = args.value.toString();
//         } else if (args.value is List<DateTime>) {
//           _dateCount = args.value.length.toString();
//         } else {
//           _rangeCount = args.value.length.toString();
//         }
//       });
//     }
//     // DateTime _startDate = DateTime.now();
//     // DateTime _endDate = DateTime.now().add(Duration(days: 7));
//     // Future displayDateRangePicker(BuildContext context) async {
//     //   final List<DateTime> picked = await DateRangePicker.showDatePicker(
//     //     context: context,
//     //     initialFirstDate: _startDate,
//     //     initialLastDate: _endDate,
//     //     firstDate: DateTime(DateTime.now().year - 10),
//     //     lastDate: DateTime(DateTime.now().year + 50),
//     //   );
//     //   if (picked != null && picked.length == 2) {
//     //     setState(() {
//     //       _startDate = picked[0];
//     //       _endDate = picked[1];
//     //       widget.onOk(_startDate, _endDate);
//     //     });
//     //   }
//     // }
//
//     return GetBuilder<SetOfferAndDiscountController>(
//       builder: (_) => InkWell(
//         onTap: () {
//           Get.dialog(
//             Center(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//                 width: 327.w,
//                 height: 350.h,
//                 child: SfDateRangePicker(
//                   endRangeSelectionColor: kCSubMain,
//                   startRangeSelectionColor: kCSubMain,
//                   rangeSelectionColor: kCSubMain.withOpacity(0.12),
//                   // controller: dateRangePickerController,
//                   // initialSelectedRanges: [PickerDateRange(_endDateTime,_startDateTime)],
//                   // initialSelectedDate:_startDateTime,
//                   onCancel: () {
//                     Get.back();
//                   },
//                   onSubmit: (val) {
//                     _.offerDurationController!.text = _range;
//                     _.setStartOfferDuration = _startDate;
//                     _.setEndOfferDuration = _endDate;
//                     _.setDurationNum = _endDateTime.difference(_startDateTime).inDays +1;
//                     debugPrint("_.setDurationNum ${_.durationNum}");
//                     debugPrint("_startDate $_startDate");
//                     debugPrint("_startDateTime $_startDateTime");
//                     debugPrint("_endDate $_endDate");
//                     debugPrint("_endDateTime $_endDateTime");
//                     Get.back();
//                   },
//                   showActionButtons: true,
//                   onSelectionChanged: _onSelectionChanged,
//                   selectionMode: DateRangePickerSelectionMode.range,
//                   initialSelectedRange: PickerDateRange(
//                     _startDateTime,
//                     _endDateTime,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//         child: Container(
//           height: 68.h,
//           width: 68.h,
//           decoration: BoxDecoration(
//             color: kCBGTextFormFiled,
//             borderRadius: BorderRadius.circular(10.r),
//           ),
//           child: Center(
//               child: CustomText(
//             text: " ${_.durationNum} ${"Day_".tr}",
//             fontSize: 12,
//             fontW: FW.semibold,
//             color: kCSubMain,
//           )),
//         ),
//       ),
//     );
//   }
// }

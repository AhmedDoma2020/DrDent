import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RangeSliderWidget extends StatefulWidget {
  final Function onSelected;
   int startSalary;
   int endSalary;
  final bool isEdit;
   RangeSliderWidget({required this.onSelected ,
    required this.startSalary,
    required this.endSalary,
    this.isEdit =false,
    Key? key}) : super(key: key);
  @override
  State<RangeSliderWidget> createState() => _RangeSliderWidgetState();
}
class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  RangeValues _currentRangeValues = const RangeValues(1000, 5000);
   int startSalary=1000;
   int endSalary=5000;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: "salary_".tr,fontW: FW.semicond,fontSize: 16,),
              CustomText(text: "${'from_'.tr} ${widget.startSalary} - ${widget.endSalary} ${'E_G_P'.tr}".tr,fontW: FW.medium,fontSize: 14,color: kCSubMain,),
            ],
          ),
        RangeSlider(
          values: _currentRangeValues,
          max: 50000,
          min: 0,
          divisions: 6500,
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
              widget.onSelected(values.start.toInt(),values.end.toInt());
              widget.startSalary =values.start.toInt();
              widget.endSalary =values.end.toInt();
            });
          },
        ),
      ],
    );
  }
}
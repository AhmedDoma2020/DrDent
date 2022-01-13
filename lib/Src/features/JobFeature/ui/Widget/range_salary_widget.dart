import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RangeSliderWidget extends StatefulWidget {
  final Function onSelected;
  const RangeSliderWidget({required this.onSelected ,
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
              CustomText(text: "salary_".tr,fontW: FW.medium,fontSize: 14,),
              CustomText(text: "من $startSalary - $endSalary جنيه".tr,fontW: FW.medium,fontSize: 14,color: kCSubMain,),
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
              widget.onSelected(values.start,values.end);
              startSalary =values.start.toInt();
              endSalary =values.end.toInt();
            });
          },
        ),
      ],
    );
  }
}
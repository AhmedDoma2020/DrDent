import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/row_jop_requirement_form.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyOfferFeature/Ui/Widget/select_offer_duration.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class JobRequirementsWidget extends StatefulWidget {
  @override
  State<JobRequirementsWidget> createState() => _JobRequirementsWidgetState();
}
class _JobRequirementsWidgetState extends State<JobRequirementsWidget> {
  int itemCount =1;
  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
        itemBuilder: (context, index) => RowJopRequirementForm(
          numOfList:itemCount,
          index : index,
          text: "aa",
          onTap: (){
            if(index ==0){
              setState(() {
                itemCount++;
              });
            }else{
             if((index + 1) == itemCount){
               setState(() {
                 itemCount--;
               });
             }
            }
        },),
      separatorBuilder: (context, index) => 16.0.ESH(),
      itemCount: itemCount,
    );
  }
}


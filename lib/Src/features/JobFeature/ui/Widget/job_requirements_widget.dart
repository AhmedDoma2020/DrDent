import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/controller/add_a_jop_controller.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/row_jop_requirement_form.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyOfferFeature/Ui/Widget/select_offer_duration.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class JobRequirementsWidget extends StatefulWidget {
  @override
  State<JobRequirementsWidget> createState() => _JobRequirementsWidgetState();
}
class _JobRequirementsWidgetState extends State<JobRequirementsWidget> {
  AddAJopOfferController addAJopOfferController = Get.find();
  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return GetBuilder<AddAJopOfferController>(
      builder: (_) =>
          ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
          // controller: ,
          itemBuilder: (context, index) => _.showWidget[index],
        separatorBuilder: (context, index) => 16.0.ESH(),
        itemCount: _.showWidget.length,
      ),
    );
  }
}


import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_request.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';
class ListJobRequests extends StatelessWidget {
  const ListJobRequests({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        itemBuilder: (context, index) => CardJobRequest(),
        separatorBuilder: (context, index) => 16.0.ESH(),
        itemCount: 30,
        shrinkWrap: true,

    );
  }
}

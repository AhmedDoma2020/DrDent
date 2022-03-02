import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_request.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../features/JobFeature/ui/screens/add_job_request_bottun_sheet.dart';
import '/src/core/utils/extensions.dart';

class ListJobRequests extends StatelessWidget {
  final List<JobRequest> requests;

  const ListJobRequests({Key? key, required this.requests}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: CardJobRequest(
          request: requests[index],


        ),
        separatorBuilder: (context, index) => 16.0.ESH(),
        itemCount: requests.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),

    );
  }
}

import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_request.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../features/JobFeature/ui/screens/add_job_request_bottun_sheet.dart';
import '/src/core/utils/extensions.dart';
class SliderJobRequests extends StatelessWidget {
  final List<JobRequest> requests;
  final Function(int) onDelete;
  const SliderJobRequests({Key? key,required this.requests,required this.onDelete}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        itemBuilder: (context, index) => CardJobRequest(
          width: 330,
          isMine: true,
          request: requests[index],
          onDelete: (){
            onDelete(requests[index].id!);
          },
          onEdit: (){
            Get.bottomSheet(AddJobRequestButtonSheet(isEdit: true,jobRequestModel:requests[index]),
                isScrollControlled: true);
          },
        ),
        separatorBuilder: (context, index) => 16.0.ESW(),
        itemCount: requests.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
    );
  }
}

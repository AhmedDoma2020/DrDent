import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/controller/job_request_controller.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/lists/list_job_requests.dart';
import 'package:dr_dent/Src/ui/widgets/sliders/slider_job_requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/src/core/utils/extensions.dart';

class JobRequestScreen extends StatelessWidget {
  const JobRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobRequestController _jobRequestController = Get.find();
    return GetBuilder<JobRequestController>(
      builder: (_) => _.status != RequestStatus.done
          ? Center(
              child: Loader(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                _.fetchJobRequests();
              },
              child: ListView(
                children: [
                  _.myJobRequests.isNotEmpty
                      ? Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                              child: Row(
                                children: [
                                  CustomText(
                                    text: 'طلباتي',
                                    fontW: FW.demi,
                                    fontSize: 14,
                                    color: kCMainBlack2,
                                  ),
                                ],
                              ),
                            ),
                            16.0.ESH(),
                            SizedBox(
                                height: 180.h,
                                child: SliderJobRequests(
                                  requests: _.myJobRequests,
                                  onDelete: (id) {
                                    _.deleteRequest(id: id);
                                  },
                                )),
                            16.0.ESH(),
                          ],
                        )
                      : 0.0.ESH(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: Row(
                      children: [
                        CustomText(
                          text: 'كل الطلبات',
                          fontW: FW.demi,
                          fontSize: 14,
                          color: kCMainBlack2,
                        ),
                      ],
                    ),
                  ),
                  16.0.ESH(),
                  ListJobRequests(
                    requests: _.jobRequests,
                  ),
                ],
              ),
            ),
    );
  }
}

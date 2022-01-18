import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/controller/job_offers_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/lists/list_job_offer.dart';
import 'package:dr_dent/Src/ui/widgets/lists/list_job_requests.dart';
import 'package:dr_dent/Src/ui/widgets/sliders/slider_job_offer.dart';
import 'package:dr_dent/Src/ui/widgets/sliders/slider_job_requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobOffersScreen extends StatelessWidget {
  const JobOffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobOffersController _jobOffersController = Get.find();
    return GetBuilder<JobOffersController>(
      builder: (_) =>
          _.status != RequestStatus.done?
          0.0.ESH():
          ListView(
        children: [
          _.myJobOffers.isNotEmpty?
          Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: 16.0.w
                ),
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
                  height: 200.h,
                  child: SliderJobOffers(offers: [],)
              ),
              16.0.ESH(),
            ],
          ):0.0.ESH(),
         Column(
           children: [
             Padding(
               padding:  EdgeInsets.symmetric(
                   horizontal: 16.0.w
               ),
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
             0.0.ESH(),
             ListJobOffers(offers: _.jobOffers,),
           ],
         ),
        ],
      )
    );
  }
}

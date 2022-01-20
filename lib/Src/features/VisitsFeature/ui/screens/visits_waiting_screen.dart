import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/VisitsFeature/ui/bloc/controller/visits_new_controller.dart';
import 'package:dr_dent/Src/features/VisitsFeature/ui/bloc/controller/visits_waiting_controller.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_visit.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class VisitsWaitingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(VisitsWaitingController());
    return GetBuilder<VisitsWaitingController>(
      builder: (_)=>
          _.status != RequestStatus.done?
          Center(child: Loader(),):
          _.visits.isEmpty?
          EmptyIconWidget(title: '! ليس لديك حجوزات الآن',image: 'novisits.png',):
          ListView.separated(
          itemBuilder: (context, index) => Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 16.w
            ),
            child: CardVisit(),
          ),
          separatorBuilder: (context, index) => 16.0.ESH(),
          itemCount: _.visits.length,
          shrinkWrap: true,
      ),
    );
  }
}

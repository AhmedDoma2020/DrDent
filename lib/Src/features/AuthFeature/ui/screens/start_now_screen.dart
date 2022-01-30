import 'package:dr_dent/Src/bloc/controller/navigation_routs_controller.dart';
import 'package:get_storage/get_storage.dart';

import '../../../ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/View/Screens/set_detection_location_details_screen.dart';
import 'package:dr_dent/Src/ui/widgets/EmptyWidget/empty_widget.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartNowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    debugPrint("box.read('user_type_id') ${box.read('user_type_id')}");
    return SafeArea(
      child: Scaffold(
        body: EmptyWidget(
          image: "assets/image/emptyStartNow.png",
          title: "start_now_title",
          subTitle: "start_now_sub_title",
          titleButton: "start_now",
          onTapButton: () {
            navigationAfterStartNowScreen(grade: box.read('user_type_id'));
            // Get.to(()=>SetDetectionLocationDetailsScreen(isAuth: true,));
          },
        ),
      ),
    );
  }
}

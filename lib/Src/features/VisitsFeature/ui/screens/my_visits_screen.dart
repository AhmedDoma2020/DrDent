import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/VisitsFeature/ui/bloc/controller/my_visit_controller.dart';
import 'package:dr_dent/Src/features/VisitsFeature/ui/screens/visits_finish_screen.dart';
import 'package:dr_dent/Src/features/VisitsFeature/ui/screens/visits_new_screen.dart';
import 'package:dr_dent/Src/features/VisitsFeature/ui/screens/visits_waiting_screen.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/tabs/tabs_ios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';
class MyVisitScreen extends StatelessWidget {
  const MyVisitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyVisitsController());
    return GetBuilder<MyVisitsController>(
      builder: (_) =>  Scaffold(
        appBar: AppBars.appBarDefault(title: 'Reservations_'),
        body: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(
                vertical: 16.h
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   TabsIos(
                     titles: const [
                     'New_',
                     'pending_',
                     'finished_'
                   ],
                   onTap: (index){
                       _.tabIndex=index;
                   },
                     tabIndex: _.tabIndex,
                   ),

                ],
              ),
            ),
            Expanded(
              child: [
                VisitsNewScreen(),
                VisitsWaitingScreen(),
                VisitsFinishScreen(),
              ][_.tabIndex],
            ),
          ],
        ),
      ),
    );
  }
}

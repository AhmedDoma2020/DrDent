import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/BaseFeature/bloc/contoller/base_controller.dart';
import 'package:dr_dent/Src/features/HomeFeature/bloc/controller/home_visits_controller.dart';
import 'package:dr_dent/Src/features/HomeFeature/bloc/model/home_model.dart';
import 'package:dr_dent/Src/features/HomeFeature/ui/widgets/empty_visits_section.dart';
import 'package:dr_dent/Src/features/HomeFeature/ui/widgets/home_item.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_visit.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/sliders/slider_visits.dart';
import 'package:dr_dent/Src/ui/widgets/titles/title_row_view_all.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const   HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BaseController  baseController = Get.put(BaseController());
    Get.put(HomeVisitsController());
    return GetBuilder<HomeVisitsController>(
      builder: (_) =>  ListView(
        children: [
         _.status != RequestStatus.done?
             0.0.ESH():
             Column(
               children: [
                 _.nextVisits.isNotEmpty?
                 Padding(
                   padding:  EdgeInsets.symmetric(
                       vertical: 16.h
                   ),
                   child: Column(
                     children: [
                       TitleRowViewAll(titleSlider: 'الحجز التالي', onTap: (){},titleOnTap: '',),
                       16.0.ESH(),
                       CardVisit(width: 343,),
                     ],
                   ),
                 ):0.0.ESH(),
                 _.newVisits.isNotEmpty?
                 Padding(
                   padding:  EdgeInsets.symmetric(
                       vertical: 16.h
                   ),
                   child: SliderVisits(),
                 ):
                 Padding(
                   padding:  EdgeInsets.symmetric(
                       vertical: 16.h,
                       horizontal: 16.w
                   ),
                   child: EmptyVisitsSection(),
                 ),
               ],
             ),
          ListView.separated(
            separatorBuilder: (context, index) => 16.0.ESH(),
            itemBuilder: (context, index) => HomeItem(
              homeModel: homeModelExamples[index],
              onTap: (){
                print(homeModelExamples[index].id);
                baseController.tabIndex=homeModelExamples[index].id;
              },
            ),
            itemCount  : homeModelExamples.length,
            shrinkWrap : true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}

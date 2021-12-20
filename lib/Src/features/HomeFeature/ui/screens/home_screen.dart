import 'package:dr_dent/Src/features/HomeFeature/bloc/model/home_model.dart';
import 'package:dr_dent/Src/features/HomeFeature/ui/widgets/empty_visits_section.dart';
import 'package:dr_dent/Src/features/HomeFeature/ui/widgets/home_item.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_visit.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/sliders/slider_visits.dart';
import 'package:dr_dent/Src/ui/widgets/titles/title_row_view_all.dart';
import 'package:flutter/material.dart';
import '/src/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBars.appBarDefault(title: 'الصفحة الرئيسية'),
      body: ListView(
        children: [
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
          ),
          Padding(
            padding:  EdgeInsets.symmetric(
                vertical: 16.h
            ),
            child: SliderVisits(),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: 16.w
            ),
            child: EmptyVisitsSection(),
          ),
          Expanded(
            child: ListView.separated(
             separatorBuilder: (context, index) => 16.0.ESH(),
              itemBuilder: (context, index) => HomeItem(
                homeModel: homeModelExamples[index],
                onTap: (){
                  print(homeModelExamples[index].id);
                },
              ),
              itemCount  : homeModelExamples.length,
              shrinkWrap : true,
              physics: NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}

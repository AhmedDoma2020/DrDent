import 'package:dr_dent/Src/ui/widgets/Cards/card_visit.dart';
import 'package:dr_dent/Src/ui/widgets/titles/title_row_view_all.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '/src/core/utils/extensions.dart';
class SliderVisits extends StatelessWidget {
  const SliderVisits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleRowViewAll(titleSlider: 'الحجوزات الجديدة', onTap: (){},),
        16.0.ESH(),
        SizedBox(
          height: 190.h,
          child: ListView.separated(
              itemBuilder: (context, index) => Padding(
                padding:  EdgeInsets.only(
                  right: index==0 ? 16.w:0.w
                ),
                child: Center(child: CardVisit(width: 314,)),
              ),
              separatorBuilder: (context, index) => 16.0.ESW(),
              itemCount: 30,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}

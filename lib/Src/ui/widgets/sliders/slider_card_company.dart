import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_company.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_offer.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_request.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_product.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/titles/title_row_view_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';
class SliderCardCompany extends StatelessWidget {
  final String viewAllTitle;
  final VoidCallback? onViewAllTap;
  const SliderCardCompany({Key? key,this.onViewAllTap,this.viewAllTitle=''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TitleRowViewAll(titleSlider:viewAllTitle, onTap: (){}),
        12.0.ESH(),
        SizedBox(
          height: 169.h,
          child: ListView.separated(
              itemBuilder: (context, index) => Padding(
                padding:  EdgeInsets.only(
                  right: index ==0 ? 16.0.w : 0,
                ),
                child: CardCompany(),
              ),
              separatorBuilder: (context, index) => 16.0.ESW(),
              itemCount: 30,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}

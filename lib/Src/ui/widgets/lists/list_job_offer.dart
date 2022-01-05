import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_offer.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_request.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';
class ListJobOffers extends StatelessWidget {
  final ScrollPhysics? physics;


  ListJobOffers({this.physics});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding:  EdgeInsets.only(
            top:  index ==0 ? 16.w : 0.0.w,
            left:  16.w,
            right: 16.w
          ),
          child: CardJobOffer(),
        ),
        separatorBuilder: (context, index) => 16.0.ESH(),
        itemCount: 30,
        shrinkWrap: true,
        physics: physics??NeverScrollableScrollPhysics(),
    );
  }
}

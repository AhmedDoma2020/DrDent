import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_offer.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_offer.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_request.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';
class SliderJobOffers extends StatelessWidget {
  final List<JobOffer> offers;

  const SliderJobOffers({Key? key,required this.offers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        itemBuilder: (context, index) => CardJobOffer(offer: offers[index],),
        separatorBuilder: (context, index) => 16.0.ESW(),
        itemCount: offers.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
    );
  }
}

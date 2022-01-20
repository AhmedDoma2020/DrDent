import 'package:dr_dent/Src/bloc/model/product.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_offer.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_request.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_product.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/titles/title_row_view_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';
class SliderCardProduct extends StatelessWidget {
  final String viewAllTitle;
  final VoidCallback? onViewAllTap;
  final List<Product> products;
  const SliderCardProduct({Key? key,this.onViewAllTap,this.viewAllTitle='',required this.products}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TitleRowViewAll(titleSlider:viewAllTitle, onTap: onViewAllTap??(){}),
        12.0.ESH(),
        SizedBox(
          height: 180.h,
          child: ListView.separated(
              itemBuilder: (context, index) => Padding(
                padding:  EdgeInsets.only(
                    right: index ==0 ? 16.0.w : 0,
                ),
                child: CardProduct(product: products[index],),
              ),
              separatorBuilder: (context, index) => 16.0.ESW(),
              itemCount: products.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}

import 'package:dr_dent/Src/bloc/model/product.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_offer.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_request.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_product_rect.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';
class ListCardProductRect extends StatelessWidget {
  final List<Product> products;
  final Function(int,int)? onLike;                // product id         // status
   ListCardProductRect({Key? key,required this.products,this.onLike}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding:  EdgeInsets.only(
            top: index==0? 16.w:0.0.w,
            // right: 16.w,
            // left: 16.0
          ),
          child: CardProductRect(product: products[index],onLike: (status){if(onLike!=null){onLike!(products[index].id!,status);}}),
        ),
        separatorBuilder: (context, index) => 16.0.ESH(),
        itemCount: products.length,
        shrinkWrap: true,
    );
  }
}

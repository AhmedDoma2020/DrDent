import 'package:dr_dent/Src/bloc/model/product.dart';
import 'package:dr_dent/Src/bloc/model/store.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_offer.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_request.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_product_rect.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_store_rect.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';
class ListCardStoreRect extends StatelessWidget {
  final List<Store> stores;
  ListCardStoreRect({Key? key,required this.stores}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding:  EdgeInsets.only(
            top: index==0? 16.w:0.0.w,
            // right: 16.w,
            // left: 16.0
          ),
          child: CardStoreRect(store:  stores[index],),
        ),
        separatorBuilder: (context, index) => 16.0.ESH(),
        itemCount: stores.length,
        shrinkWrap: true,
    );
  }
}

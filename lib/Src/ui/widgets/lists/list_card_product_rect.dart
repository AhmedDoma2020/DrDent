import 'package:dr_dent/Src/bloc/model/product.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_product_rect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../features/ProfileFeature/GlobalMyProductFeature/MyProductFeature/View/Screens/company_add_product_screen.dart';
import '/src/core/utils/extensions.dart';

class ListCardProductRect extends StatelessWidget {
  final bool isEdit;
  final List<Product> products;
  final Function(int, int)? onLike; // product id         // status
  ListCardProductRect({this.isEdit=true , Key? key, required this.products, this.onLike})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          top: index == 0 ? 16.w : 0.0.w,
          // right: 16.w,
          // left: 16.0
        ),
        child: CardProductRect(
          isEdit: isEdit,
          onEditTap: () {
            Get.to(()=>  CompanyAddProduct(isEdit: true,productModel: products[index],));
          },

          onDeleteTap: () {
          },
          isDelete: false,
          product: products[index],
          onLike: (status) {
            if (onLike != null) {
              onLike!(products[index].id!, status);
            }
          },
        ),
      ),
      separatorBuilder: (context, index) => 16.0.ESH(),
      itemCount: products.length,
      shrinkWrap: true,
    );
  }
}

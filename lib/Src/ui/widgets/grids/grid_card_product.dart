import 'package:dr_dent/Src/bloc/model/product.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridCardProduct extends StatelessWidget {
  final List<Product> products;

  const GridCardProduct({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (context, index) => LayoutBuilder(
        builder: (context, constraints) => CardProduct(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          product: products[index],
        ),
      ),
      shrinkWrap: true,
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 24.w, crossAxisSpacing: 24.h),
    );
  }
}

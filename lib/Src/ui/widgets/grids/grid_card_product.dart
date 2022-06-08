import 'package:dr_dent/Src/bloc/model/product.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridCardProduct extends StatelessWidget {
  final List<Product> products;
  final Function(int,int)? onLike;                // product id         // status
  const GridCardProduct({Key? key, required this.products,this.onLike}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (context, index) => LayoutBuilder(
        builder: (context, constraints) => CardProduct(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          product: products[index],
          onLike: (status){
            if(onLike!=null){
              onLike!(products[index].id!,status);
            }
          },
        ),
      ),
      shrinkWrap: true,
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 24.w, crossAxisSpacing: 24.h),
    );
  }
}

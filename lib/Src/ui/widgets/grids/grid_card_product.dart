import 'package:dr_dent/Src/ui/widgets/Cards/card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GridCardProduct extends StatelessWidget {
  const GridCardProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (context, index) => LayoutBuilder(
       builder: (context, constraints) =>CardProduct(width: constraints.maxWidth,height: constraints.maxHeight,),
      ),
      shrinkWrap: true,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 24.w,
          crossAxisSpacing: 24.h
      ),
    );
  }
}

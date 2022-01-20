import 'package:dr_dent/Src/bloc/model/product.dart';
import 'package:dr_dent/Src/bloc/model/store.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_company.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GridCardStore extends StatelessWidget {
  final List<Store> stores;
  const GridCardStore({Key? key,required this.stores}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (context, index) => LayoutBuilder(
       builder: (context, constraints) =>
           CardCompany(width: constraints.maxWidth,height: constraints.maxHeight, store: stores[index],),
      ),
      shrinkWrap: true,
      itemCount: stores.length,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 24.w,
          crossAxisSpacing: 24.h
      ),
    );
  }
}

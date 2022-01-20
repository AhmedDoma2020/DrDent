import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/lists/list_card_product_rect.dart';
import 'package:flutter/material.dart';

class CompanyProductsScreen extends StatelessWidget {
  const CompanyProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'اسم الشركة'),
      // body: ListCardProductRect()
    );
  }
}

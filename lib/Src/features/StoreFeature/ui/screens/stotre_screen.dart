import 'package:dr_dent/Src/bloc/model/add_model.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/sliders/slider_card_company.dart';
import 'package:dr_dent/Src/ui/widgets/sliders/slider_card_product.dart';
import 'package:dr_dent/Src/ui/widgets/sliders/slider_oofer.dart';
import 'package:flutter/material.dart';
import '/src/core/utils/extensions.dart';


class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        16.0.ESH(),
        CarouselList(
          resAddsList: [
            AddModel(
                id: 1,
                image: 'https://images.pexels.com/photos/3244513/pexels-photo-3244513.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
            ),
          ],
        ),
        32.0.ESH(),
        SliderCardProduct(viewAllTitle: 'أحدث المنتجات',),
        32.0.ESH(),
        SliderCardCompany(viewAllTitle: 'الشركات الطبية',),
        32.0.ESH(),
        SliderCardProduct(viewAllTitle: 'كل المنتجات',),
      ],
    );
  }
}

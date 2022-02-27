import 'package:dr_dent/Src/bloc/model/add_model.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/controller/store_controller.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/sliders/slider_card_company.dart';
import 'package:dr_dent/Src/ui/widgets/sliders/slider_card_product.dart';
import 'package:dr_dent/Src/ui/widgets/sliders/slider_oofer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';
import 'all_products_screen.dart';
import 'all_stores_screen.dart';


class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(StoreController());
    return GetBuilder<StoreController>(
      builder: (_) =>
          _.status != RequestStatus.done?
          Center(child: Loader(),):
          ListView(
        children: [
          16.0.ESH(),
          CarouselList(
            resAddsList: _.adds
          ),
          32.0.ESH(),
          SliderCardProduct(
            viewAllTitle: 'أحدث المنتجات',
             titleOnTap: '',
            products: _.recentlyProducts,
          ),
          32.0.ESH(),
          SliderCardCompany(
            viewAllTitle: 'الشركات الطبية',
            stores: _.stores,
            onViewAllTap: (){
              Get.to(()=>AllStoresScreen());
            },
          ),
          32.0.ESH(),
          SliderCardProduct(
            viewAllTitle: 'كل المنتجات',
            products: _.products,
            onViewAllTap: (){
              Get.to(()=>AllProductsScreen());
            },
          ),
        ],
      ),
    );
  }
}

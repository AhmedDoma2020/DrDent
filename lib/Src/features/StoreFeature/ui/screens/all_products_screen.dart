import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/controller/all_products_controller.dart';
import 'package:dr_dent/Src/features/StoreFeature/ui/widgets/search_row.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/grids/grid_card_product.dart';
import 'package:dr_dent/Src/ui/widgets/lists/list_card_product_rect.dart';
import 'package:dr_dent/Src/ui/widgets/tabs/tabs_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';


class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(AllProductsController());
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'كل المنتجات'),
      body: Padding(
        padding:  EdgeInsets.only(
          right: 16.w,
          left: 16.w,
          top: 10.h
        ),
        child:GetBuilder<AllProductsController>(
          builder: (_) =>  Column(
            children: [
              SearchRow(
                onGridTap: (){_.changeIsGrid();},
                onWordChange: (value){_.searchWord(word: value);},
              ),
              16.0.ESH(),
              // const TabsCategory(),
              // 16.0.ESH(),
               Expanded(
              child:
              _.status != RequestStatus.done?
              Center(child: Loader(),):AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                   curve: Curves.easeIn,
                   child: !_.isGrid?
                   ListCardProductRect(products: _.isSearch?_.searchProducts:_.products,onLike: (id,status){
                  _.handleLikeProduct(id: id, status: status);
               }):
                   GridCardProduct(products: _.isSearch?_.searchProducts:_.products,onLike: (id,status){
                     _.handleLikeProduct(id: id, status: status);
                   }
                   ),
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}

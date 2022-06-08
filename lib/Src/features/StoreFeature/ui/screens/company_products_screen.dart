import 'package:dr_dent/Src/bloc/model/store.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/controller/all_products_controller.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/controller/compancy_products_controller.dart';
import 'package:dr_dent/Src/features/StoreFeature/ui/widgets/search_row.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/EmptyWidget/empty_widget.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/grids/grid_card_product.dart';
import 'package:dr_dent/Src/ui/widgets/lists/list_card_product_rect.dart';
import 'package:dr_dent/Src/ui/widgets/tabs/tabs_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';

class CompanyProductsScreen extends StatelessWidget {
  final Store store;

  const CompanyProductsScreen({Key? key, required this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CompanyProductsController(storeId: store.id));
    return Scaffold(
      appBar: AppBars.appBarDefault(title: store.name!),
      body: Padding(
        padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 10.h),
        child: GetBuilder<CompanyProductsController>(
          builder: (_) => Column(
            children: [
              SearchRow(
                onGridTap: () {
                  _.changeIsGrid();
                },
                onWordChange: (value) {},
              ),
              16.0.ESH(),
              // const TabsCategory(),
              // 16.0.ESH(),
              Expanded(
                child: _.status != RequestStatus.done
                    ? Center(child: Loader())
                    : _.products.isNotEmpty
                        ? AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                            child: !_.isGrid
                                ? ListCardProductRect(
                              isEdit: false,
                                    products: _.products,
                                  )
                                : GridCardProduct(
                                    products: _.products,
                                  ),
                          )
                        : EmptyWidget(
                            image: 'assets/image/emptyProduct.png',
                            onTapButton: () {},
                            availableButton: false,
                            title: 'There_are_no_products_to_display'.tr,
                          ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

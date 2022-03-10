import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/controller/all_products_controller.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/controller/compancy_products_controller.dart';
import 'package:dr_dent/Src/features/StoreFeature/ui/widgets/search_row.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_product_rect.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/EmptyWidget/empty_widget.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/grids/grid_card_product.dart';
import 'package:dr_dent/Src/ui/widgets/lists/list_card_product_rect.dart';
import 'package:dr_dent/Src/ui/widgets/tabs/tabs_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '/src/core/utils/extensions.dart';
import 'company_add_product_screen.dart';


class CompanyProductsScreen extends StatelessWidget {
  final bool isMine;
  final int userId;
   CompanyProductsScreen({this.isMine = false,required this.userId ,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    Get.put(CompanyProductsController(storeId: userId));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24.w,
        ),
        onPressed: () {
          Get.to(()=> const CompanyAddProduct());
        },
        backgroundColor: kCMain,
      ),
      appBar: AppBars.appBarDefault(title: 'كل المنتجات'),
      body: Padding(
        padding:  EdgeInsets.only(
            right: 16.w,
            left: 16.w,
            top: 10.h
        ),
        child:GetBuilder<CompanyProductsController>(
          builder: (_) =>  Column(
            children: [
              // SearchRow(onGridTap: (){_.changeIsGrid();},onWordChange: (value){},),
              16.0.ESH(),
              // const TabsCategory(),
              // 16.0.ESH(),
              Expanded(
                  child:
                  _.status != RequestStatus.done?
                  Center(child: Loader(),):_.products.isEmpty ?EmptyWidget(
                    image: "assets/image/emptyProduct.png",
                    onTapButton: () {},
                    title: 'There_are_no_products_to_display'.tr,
                    availableButton: false,
                  ): AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    child:
                    ListView.separated(
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(
                          top: index == 0 ? 16.w : 0.0.w,
                          // right: 16.w,
                          // left: 16.0
                        ),
                        child: CardProductRect(
                          onEditTap: () {
                            Get.to(() => CompanyAddProduct(
                              isEdit: true,
                              productModel: _.products[index],
                            ));
                          },
                          isDelete: isMine,
                          onDeleteTap: () {
                            debugPrint("abc123");
                            _.deleteProduct(id: _.products[index].id!);
                          },
                          product: _.products[index],
                          onLike: (status) {
                            // if (onLike != null) {
                            //   onLike!(products[index].id!, status);
                            // }
                          },
                        ),
                      ),
                      separatorBuilder: (context, index) => 16.0.ESH(),
                      itemCount: _.products.length,
                      shrinkWrap: true,
                    )

                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

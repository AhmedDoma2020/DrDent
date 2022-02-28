import 'package:dr_dent/Src/bloc/model/product.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/StoreFeature/ui/widgets/product_info_item.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';
import '/src/core/utils/extensions.dart';
import 'inquiry_of_product.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 300.h,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.only(
                      bottomLeft:  Radius.circular(30.r),
                      bottomRight: Radius.circular(30.r),
                    )
                  ),
                  child: ImageNetwork(
                    url: product.images!.isNotEmpty? product.images!.first : '',
                    width: double.infinity,
                    height: 300.h,
                  ),
                ),
                16.0.ESH(),
                Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: 16.w
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      CustomText(
                        text: product.categoryTitle,
                        color: kCMainGrey,
                        fontW: FW.thin,
                        fontSize: 14,
                      ),
                      4.0.ESH(),
                       ProductInfoItem(
                        title: product.title!,
                        subtitle: product.description!
                      ),
                      15.0.ESH(),
                      ProductInfoItem(
                        title: 'How_to_use'.tr,
                        subtitle: product.usability!,
                      ),
                      // 100.0.ESH(),
                    ],
                  ),
                ),
              ],
            ),
            product.companyId == box.read('id')?0.0.ESW():
            Padding(
              padding:  EdgeInsets.only(bottom: 24.h,right: 16.w,left: 16.w),
              child: ButtonDefault(
                title: 'inquire_about_product_price',
                onTap: () {
                  Get.bottomSheet(
                      InquiryOfProductButtonSheet(

                      ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

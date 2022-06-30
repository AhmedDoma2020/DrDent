import 'package:dr_dent/Src/bloc/model/product.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/StoreFeature/ui/widgets/product_info_item.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';

import '/src/core/utils/extensions.dart';
import '../../bloc/controller/like_product_controller.dart';
import 'inquiry_of_product.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  final Function(int)? onLike; // status
  const ProductScreen({Key? key, required this.product, this.onLike})
      : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int indexOfPageView=0;
  @override
  Widget build(BuildContext context) {
    debugPrint(
        "widget.product.images!.length ${widget.product.images!.length}");
    LikeProductController _likeProductController =
        Get.put(LikeProductController());
    GetStorage box = GetStorage();
    final PageController controller = PageController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300.h,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: kCMainLightGrey.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.r),
                          bottomRight: Radius.circular(30.r),
                        )),
                    child: widget.product.images!.isNotEmpty
                        ? Stack(
                            children: [
                              PageView(
                                onPageChanged: (indexNum){
                                  setState(() {
                                    indexOfPageView = indexNum;
                                  });
                                },
                                scrollDirection: Axis.horizontal,
                                controller: controller,
                                children: widget.product.images!
                                    .map((e) => ImageNetwork(
                                          url: e,
                                          width: double.infinity,
                                          height: 300.h,
                                        ))
                                    .toList(),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.transparent,
                                    height: 4,
                                    width: 28.w * widget.product.images!.length,
                                    child: Center(
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) => Container(
                                          decoration: BoxDecoration(
                                            color: indexOfPageView == index ? kCMainGrey: kCMainLightGrey.withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(2.r)
                                          ),
                                          height: 5.h,
                                          width: 20.w,
                                        ),
                                        separatorBuilder: (context, index) =>
                                            5.0.ESW(),
                                        itemCount: widget.product.images!.length,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : ImageNetwork(
                            url: '',
                            width: double.infinity,
                            height: 300.h,
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 16.h, horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        2.0.ESW(),
                        widget.product.companyId == box.read('id')
                            ? 0.0.ESW()
                            : GestureDetector(
                                onTap: () {
                                  _likeProductController.likeProduct(
                                      id: widget.product.id!,
                                      onSuccess: (status) {
                                        setState(() {
                                          widget.product.like = status;
                                        });
                                        if (widget.onLike != null) {
                                          widget.onLike!(status);
                                        }
                                      });
                                },
                                child: Container(
                                  width: 40.h,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(40.r)),
                                  child: Center(
                                      child: Icon(
                                    widget.product.like == 1
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: kCMain,
                                    size: 20.h,
                                  )),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
              16.0.ESH(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: [
                    CustomText(
                      text: widget.product.categoryTitle,
                      color: kCMainGrey,
                      fontW: FW.thin,
                      fontSize: 14,
                    ),
                    4.0.ESH(),
                    ProductInfoItem(
                        title: widget.product.title!,
                        subtitle: widget.product.description!),
                    15.0.ESH(),
                    ProductInfoItem(
                      title: 'How_to_use'.tr,
                      subtitle: widget.product.usability!,
                    ),
                    // 100.0.ESH(),
                  ],
                ),
              ),
            ],
          ),
          widget.product.companyId == box.read('id')
              ? 0.0.ESW()
              : Padding(
                  padding:
                      EdgeInsets.only(bottom: 24.h, right: 16.w, left: 16.w),
                  child: ButtonDefault(
                      title: 'inquire_about_product_price',
                      onTap: () {
                        Get.bottomSheet(
                          InquiryOfProductButtonSheet(
                            productId: widget.product.id!,
                          ),
                        );
                      }),
                ),
        ],
      ),
    );
  }
}

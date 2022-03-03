import 'package:dr_dent/Src/bloc/model/product.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/StoreFeature/ui/screens/product_screen.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../GeneralWidgets/delete_widget.dart';
import '../GeneralWidgets/edit_widget.dart';
import '/src/core/utils/extensions.dart';
class CardProductRect extends StatelessWidget {
  final Product product;
  final Function(int)? onLike;
  final VoidCallback onDeleteTap;
  final VoidCallback onEditTap;// status
  const CardProductRect({Key? key,required this.product,this.onLike,required this.onEditTap,required this.onDeleteTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>ProductScreen(product: product,onLike: (status){if(onLike!=null){onLike!(status);}},));
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r)
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80.w,
                height: 70.36.h,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ImageNetwork(
                  url: product.images!.isNotEmpty? product.images!.first:'',
                  width: 100.w,
                  height: 80.h,
                ),
              ),
              16.0.ESW(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: product.title,
                      fontSize: 16,
                      fontW: FW.demi,
                      color: kCMainBlack2,
                    ),
                    7.0.ESH(),
                    CustomText(
                      text: product.companyName,
                      fontSize: 12,
                      fontW: FW.light,
                      color: kCMainGrey,
                    ),
                  ],
                ),
              ),
              // IconWidget(onEditTap: onEditTap,icon: "assets/icons/edit.png",),
              DeleteWidget(onDeleteTap: onDeleteTap),
            ],
          ),
        ),
      ),
    );
  }
}

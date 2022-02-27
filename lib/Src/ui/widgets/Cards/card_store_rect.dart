import 'package:dr_dent/Src/bloc/model/product.dart';
import 'package:dr_dent/Src/bloc/model/store.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/StoreFeature/ui/screens/company_screen.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';
class CardStoreRect extends StatelessWidget {
  final Store store;

  const CardStoreRect({Key? key,required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>CompanyScreen(store: store,));
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
            children: [
              Container(
                width: 80.w,
                height: 70.36.h,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ImageNetwork(
                  url: store.image,
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
                      text: store.name,
                      fontSize: 16,
                      fontW: FW.demi,
                      color: kCMainBlack2,
                    ),
                    7.0.ESH(),
                    CustomText(
                      text: 'health co',
                      fontSize: 12,
                      fontW: FW.light,
                      color: kCMainGrey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

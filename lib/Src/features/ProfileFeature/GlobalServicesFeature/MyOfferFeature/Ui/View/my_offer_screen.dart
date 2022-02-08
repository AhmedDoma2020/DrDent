import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyOfferFeature/Bloc/Controller/fetch_my_offer_and_discount_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyOfferFeature/Ui/Widget/my_offer_and_discount_row_form.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/EmptyWidget/empty_widget.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'add_offer_screen.dart';

class MyOfferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FetchMyOfferAndDiscountController _fetchMyOfferAndDiscountController =
        Get.put(FetchMyOfferAndDiscountController());
    Future<void> onRefresh() async {}
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 24.w,
          ),
          onPressed: () {
            Get.to(() => AddOfferAndDiscountScreen());
          },
          backgroundColor: kCMain,
        ),
        appBar: AppBars.appBarDefault(
            title: "Offers_and_discounts".tr,
            onTap: () {
              Get.back();
            }),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: GetBuilder<FetchMyOfferAndDiscountController>(
            builder: (_) => _.status == RequestStatus.loading? Center(child: Loader(),) : _.myOfferAndDiscountList.isEmpty
                ? EmptyWidget(
                    image: "assets/image/emptyOfferAndDiscount.png",
                    onTapButton: () {},
                    availableButton: false,
                    title: "empty_Offers_and_discounts".tr,
                    imageH: 134,
                    imageW: 134,
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => MyOfferAndDiscountRow(
                      offerAndDiscount: _.myOfferAndDiscountList[index],
                      onDeleteTap:_.snackBarStatus == SnackbarStatus.CLOSED? () {
                        _.deleteOfferAndDiscount(
                            offerAndDiscountId:
                                _.myOfferAndDiscountList[index].id,
                            );
                      }:(){},
                      onEditTap: () {},
                    ),
                    separatorBuilder: (context, index) => 16.0.ESH(),
                    itemCount: _.myOfferAndDiscountList.length,
                  ),
          ),
        ),
      ),
    );
  }
}

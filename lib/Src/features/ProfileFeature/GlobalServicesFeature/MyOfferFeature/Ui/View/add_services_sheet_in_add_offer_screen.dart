import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyOfferFeature/Ui/Widget/row_my_services_form.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Controller/fetch_my_services_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/row_top_bottom_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';

class AddServicesButtonSheet extends StatelessWidget {
  final  VoidCallback onTap;

  AddServicesButtonSheet({required this.onTap});

  @override
  Widget build(BuildContext context) {
   // Get.put(FetchMyServicesController());
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(19.r),
          topRight: Radius.circular(19.r),
        ),
        child: Container(
          width: double.infinity,
          height: 520.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(19.r),
                topRight: Radius.circular(19.r),
              ),
              color: Colors.white),
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 24.h),
            child: GetBuilder<FetchMyServicesController>(
              builder: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RowTopBottomSheet(title: "insurance_companies".tr),
                        24.0.ESH(),
                        Container(
                          // height: 260.h,
                          constraints: BoxConstraints(maxHeight: 340.h),
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => RowMyServicesForm(
                              insurance: _.myServicesList[index],
                              // isSelect: _.insuranceList[index].active,
                              onSelectTap: (){_.changeSelectServices(servicesIndex: index);},
                            ),
                            separatorBuilder: (context, index) =>0.0.ESH(),
                            itemCount: _.myServicesList.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonDefault(
                    title: 'save_'.tr,
                    onTap:onTap,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

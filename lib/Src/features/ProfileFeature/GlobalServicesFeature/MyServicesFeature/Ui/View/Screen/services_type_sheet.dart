import 'package:dr_dent/Src/bloc/model/service_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Controller/fetch_available_services_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Controller/set_services_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/row_top_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/src/core/utils/extensions.dart';

class ServicesButtonSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FetchAvailableServicesController _fetchAvailableServicesController =
        Get.put(FetchAvailableServicesController());
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(19.r),
          topRight: Radius.circular(19.r),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          width: double.infinity,
          height: 500.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(19.r),
                topRight: Radius.circular(19.r),
              ),
              color: Colors.white),
          child: GetBuilder<FetchAvailableServicesController>(
            builder: (_) => Column(
              children: [
                24.0.ESH(),
                RowTopBottomSheet(
                  title: "select_service".tr,
                  isClose: false,
                ),
                24.0.ESH(),
                Expanded(
                  // height: 400.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => GetBuilder<SetServicesController>(
                      builder:(setServiceType) =>  InkWell(
                        onTap: (){
                          _.changeSIndex(index);
                          setServiceType.servicesTypeSelectedController!.text=_.servicesList[index].title.toString();
                          setServiceType.setServicesId=_.servicesList[index].id;
                          Get.back();
                        },
                        child: ServicesRowForm(
                          service: _.servicesList[index],
                          isSelected: _.daySIndex == index,
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => Divider(
                      height: 2.h,
                      color: kCTFEnableBorder,
                    ),
                    itemCount: _.servicesList.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServicesRowForm extends StatelessWidget {
  final ServiceModel service;
  final bool isSelected;

  // final  VoidCallback  onSelectTap;

  const ServicesRowForm({
    required this.service,
    required this.isSelected,
    // required this.onSelectTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: service.title,
            fontW: FW.semibold,
            fontSize: 24.sp,
          ),
          Container(
            height: 24.h,
            width: 24.h,
            decoration: BoxDecoration(
              color: isSelected == false ? Colors.transparent : kCSubMain,
              borderRadius: BorderRadius.circular(777.r),
              border: Border.all(
                  width: 2.w,
                  color: isSelected != false
                      ? Colors.transparent
                      : kCMainGrey),
            ),
            child: isSelected == false
                ? 0.0.ESH()
                : Icon(
                    Icons.check,
                    size: 14.w,
                    color: Colors.white,
                  ),
          )
        ],
      ),
    );
  }
}

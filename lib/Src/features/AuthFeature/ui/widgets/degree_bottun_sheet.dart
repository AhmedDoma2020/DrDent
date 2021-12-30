import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/enter_my_personal_data_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/fetch_scientific_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/row_degree_form.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyOfferFeature/Ui/Widget/row_my_services_form.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Controller/fetch_my_services_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/row_top_bottom_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';

class DegreeButtonSheet extends StatelessWidget {
  final  Function onTap;
  DegreeButtonSheet({required this.onTap});
  @override
  Widget build(BuildContext context) {
    Get.put(FetchScientificController());
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
            child: GetBuilder<FetchScientificController>(
              builder: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RowTopBottomSheet(title: "Degree_".tr),
                          24.0.ESH(),
                          Container(
                            constraints: BoxConstraints(maxHeight: 340.h),
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => InkWell(
                                onTap: (){
                                  _.changeSIndex(index);
                                  onTap(_.scientificList[index].title ,_.scientificList[index].id );
                                  Get.back();
                                },
                                child: RowDegreeForm(
                                  scientificModel: _.scientificList[index],
                                  isSelected: _.scientificList[index].selected == true,
                                ),
                              ),
                              separatorBuilder: (context, index) =>0.0.ESH(),
                              itemCount: _.scientificList.length,
                            ),
                          ),
                        ],
                      ),

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
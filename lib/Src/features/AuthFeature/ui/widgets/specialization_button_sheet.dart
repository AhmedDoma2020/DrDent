
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/enter_my_personal_data_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/fetch_specialization_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/row_specialization_form.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Controller/fetch_available_insurances_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Controller/set_insurance_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Ui/Widget/row_available_insurance_form.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/row_top_bottom_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';

class specializationButtonSheet extends StatelessWidget {
  final  Function onTapNotEmpty;
  final  Function onTapEmpty;
  specializationButtonSheet({
    required this.onTapNotEmpty,
    required this.onTapEmpty,
  });
  @override
  Widget build(BuildContext context) {
    FetchSpecializationController _fetchSpecializationController =Get.put(FetchSpecializationController());
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(19.r),
          topRight: Radius.circular(19.r),
        ),
        child: Container(
          width: double.infinity,
          height: 480.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(19.r),
                topRight: Radius.circular(19.r),
              ),
              color: Colors.white),
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 24.h),
            child: GetBuilder<FetchSpecializationController>(
              builder: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RowTopBottomSheet(title: "Specialization_".tr),
                        24.0.ESH(),
                        Container(
                          // height: 260.h,
                          constraints: BoxConstraints(maxHeight: 260.h),
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                RowSpecializationForm(
                              specialization: _.specializationList[index],
                              // isSelect: _.insuranceList[index].active,
                              onSelectTap: (){
                                _.changeSelectInsurance(insuranceIndex: index);
                              },
                            ),
                            separatorBuilder: (context, index) => 24.0.ESH(),
                            itemCount: _.specializationList.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GetBuilder<EnterMyPersonalDataController>(
                    builder: (enterMyPersonalDataController) => ButtonDefault(
                      title: 'save_'.tr,
                      onTap: () {
                        for(var item in _.specializationList){
                          if(item.active){
                            _.specializationIdList.add(item.id);
                            _.specializationTitleList.add(item.title);
                          }
                        }
                        if(_.specializationIdList.isEmpty){
                          _.specializationIdList.clear();
                          _.specializationTitleList.clear();
                          onTapEmpty();
                          Get.back();
                        }else{
                          onTapNotEmpty( _.specializationIdList,_.specializationTitleList.join(",") );
                          Get.back();
                        }
                      },
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

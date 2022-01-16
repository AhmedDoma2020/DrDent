
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Controller/fetch_available_insurances_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Controller/set_insurance_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Ui/Widget/row_available_insurance_form.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/row_top_bottom_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';

class AvailableInsuranceSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(FetchAvailableInsurancesController());
    SetInsurancesController _SetInsurancesController =Get.put(SetInsurancesController());
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
            child: GetBuilder<FetchAvailableInsurancesController>(
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
                            constraints: BoxConstraints(maxHeight: 260.h),
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => RowAvailableInsuranceForm(
                                insurance: _.insuranceList[index],
                                // isSelect: _.insuranceList[index].active,
                                onSelectTap: (){
                                  _.changeSelectInsurance(insuranceIndex: index);
                                },
                              ),
                              separatorBuilder: (context, index) =>24.0.ESH(),
                              itemCount: _.insuranceList.length,
                            ),
                          ),
                        ],
                      ),
                  ),
                  ButtonDefault(
                    title: 'save_'.tr,
                    onTap: () {
                        for(var item in _.insuranceList){
                          if(item.active){
                            _.insurancesIdList.add(item.id);
                          }
                        }
                        if(_.insurancesIdList.isEmpty){

                        }else{
                          _SetInsurancesController.setInsurances(insuranceId:_.insurancesIdList);
                        }
                    },
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

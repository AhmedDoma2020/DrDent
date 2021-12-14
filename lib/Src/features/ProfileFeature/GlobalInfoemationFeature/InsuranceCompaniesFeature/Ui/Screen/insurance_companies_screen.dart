import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Controller/fetch_my_insurances_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Ui/Widget/row_my_insurance_form.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Ui/Widget/sheet_available_insurances.dart';
import 'package:dr_dent/Src/ui/widgets/EmptyWidget/empty_widget.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InsuranceCompaniesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FetchMyInsurancesController _fetchMyInsurancesController =
        Get.put(FetchMyInsurancesController());
    Future<void> onRefresh() async {
      await _fetchMyInsurancesController.fetchMyInsurances();
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add,color: Colors.white,size: 24.w,),
          onPressed: (){
            Get.bottomSheet(AvailableInsuranceSheet());
          },
          backgroundColor: kCMain,
        ),
        appBar: AppBars.appBarDefault(
            title: "insurance_companies".tr,
            onTap: () {
              Get.back();
            }),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            height: double.infinity,
            width: double.infinity,
            child: GetBuilder<FetchMyInsurancesController>(
              builder: (_) => insuranceListExamples.isEmpty
                  ? EmptyWidget(
                      image: "assets/image/emptyInsuranceCompany.png",
                      onTapButton: () {},
                      availableButton: false,
                      title: "empty_insurance_company_title".tr,
                      imageH: 160,
                      imageW: 140,
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => RowMyInsuranceForm(
                        insurance: insuranceListExamples[index],
                        onDeleteTap: () {
                          _.deleteInsurances(
                              insuranceId: insuranceListExamples[index].id,
                              index: index);
                        },
                      ),
                      separatorBuilder: (context, index) => 16.0.ESH(),
                      itemCount: insuranceListExamples.length,
                    ),
            )),
      ),
    );
  }
}

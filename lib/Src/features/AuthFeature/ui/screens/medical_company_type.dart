import 'package:dr_dent/Src/bloc/controller/account_type_controller.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_of_account_type.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'new_account_screen.dart';

class MedicalCompanyTypeScreen extends StatelessWidget {
  String titleAccountType = '';
  int? indexOfCardSelected;

  @override
  Widget build(BuildContext context) {
    AccountTypeController _accountTypeController = Get.put(AccountTypeController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBars.appBarDefault(
          title: "account_type".tr,
          onTap: () {
            Get.back();
          },
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          width: double.infinity,
          child: GetBuilder<AccountTypeController>(
            builder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                24.0.ESH(),
                CustomText(
                  text: "please_select_your_account".tr,
                  fontSize: 18,
                  fontW: FW.semibold,
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 150,
                          childAspectRatio: 1.06,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 18.h,
                          // mainAxisExtent: 103
                        ),
                        itemBuilder: (context, index) => InkWell(
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            indexOfCardSelected = index;
                            _.selectCompanyMedicalIndex(index);
                            titleAccountType = _.medicalCompanyType[index].title;
                          },
                          child: CardOfAccountType(
                            icon: _.isCompanyMedicalSelected == index
                                ? _.medicalCompanyType[index].activeIcon
                                : _.medicalCompanyType[index].disActiveIcon,
                            title: _.medicalCompanyType[index].title,
                            isSelected: _.isCompanyMedicalSelected == index ? true : false,
                          ),
                        ),
                        itemCount: _.medicalCompanyType.length,
                      ),
                      140.0.ESH(),
                      _.isCompanyMedicalSelected == -1
                          ? 0.0.ESH()
                          : ButtonDefault(
                              title:
                                  '${"continue_register_as".tr}$titleAccountType',
                              onTap: () {
                                Get.to(
                                  () => NewAccountScreen(
                                    userTypeSelectedId:
                                        _.accountType[indexOfCardSelected!].id,
                                  ),
                                );
                              },
                            ),
                    ],
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

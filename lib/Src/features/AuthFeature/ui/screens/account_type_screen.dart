import 'package:dr_dent/Src/bloc/controller/account_type_controller.dart';
import 'package:dr_dent/Src/bloc/model/account_type_model.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_of_account_type.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'medical_company_type.dart';
import 'new_account_screen.dart';

class AccountTypeScreen extends StatelessWidget {
  String titleAccountType = '';
  int? indexOfCardSelected;
  @override
  Widget build(BuildContext context) {
    AccountTypeController _accountTypeController =
    Get.put(AccountTypeController());
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
                  text: "select_account_type".tr,
                  fontSize: 18,
                  fontW: FW.semibold,
                  textAlign: TextAlign.start,
                ),
                Expanded(
                  // color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            // childAspectRatio: 1.06,
                            crossAxisSpacing: 16.w,
                            mainAxisSpacing: 18.h,
                          ),
                          itemBuilder: (context, index) => InkWell(
                            hoverColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              indexOfCardSelected = index;
                              if(_.accountType[index].id == 1){
                                debugPrint("medical_company");
                              }else{
                                debugPrint("Not medical company");
                              }
                              _.selectCompanyIndex(index);
                              titleAccountType = _.accountType[index].title;
                            },
                            child: CardOfAccountType(
                              icon: _.isCompanySelected == index
                                  ? _.accountType[index].activeIcon
                                  : _.accountType[index].disActiveIcon,
                              title: _.accountType[index].title,
                              isSelected: _.isCompanySelected == index ? true : false,
                            ),
                          ),
                          itemCount: accountTypeList.length,
                        ),
                        20.0.ESH(),
                        _.isCompanySelected == -1
                            ? 0.0.ESH()
                            : ButtonDefault(
                          title: '${"continue_register_as".tr}$titleAccountType',
                          onTap: () {
                            if(_.accountType[indexOfCardSelected!].id == 1){
                              Get.to(()=> MedicalCompanyTypeScreen());
                            }else{
                              Get.to(()=>NewAccountScreen(userTypeSelectedId: _.accountType[indexOfCardSelected!].id,),);
                            }
                          },
                        ),
                      ],
                    ),
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
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/check_phone_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class ForgetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CheckPhoneController _checkPhoneController = Get.put(CheckPhoneController());
    var node = FocusScope.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBars.appBarDefault(title: 'reset_password'.tr),
        body:Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w,),
          child: GetBuilder<CheckPhoneController>(
            builder:(_) =>  ListView(
              children: [
                40.0.ESH(),
                CustomText(text: 'forget_password'.tr,fontW: FW.semibold,fontSize: 20,),
                16.0.ESH(),
                CustomText(text: 'sub_title_forget_password'.tr,fontW: FW.semibold,fontSize: 16,color: kCGreyTitle,),
                32.0.ESH(),
                CustomText(text: 'phone_number'.tr,fontW: FW.semibold,fontSize: 14,),
                14.0.ESH(),
                Form(
                  key: _.globalKey,
                  child: TextFieldDefault(
                    hint: 'enter_phone'.tr,
                    errorText: "error_phone_field".tr,
                    controller: _.phoneController,
                    keyboardType: TextInputType.phone,
                    fieldType: FieldType.WithBorder,
                    prefixIconUrl: "TFPhone",
                    horizentalPadding: 16,
                    onComplete: () {
                      node.nextFocus();
                    },
                  ),
                ),
                24.0.ESH(),
                ButtonDefault(
                  title: 'send_code'.tr,
                  onTap: (){
                    debugPrint(">>>>>>>>>>>>");
                    _.submit();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

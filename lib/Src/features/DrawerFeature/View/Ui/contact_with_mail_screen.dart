import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/DrawerFeature/Controller/Controller/contact_with_mail_controller.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ContactWithMail extends StatelessWidget {
  const ContactWithMail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ContactWithUSController _ContactWithUSController = Get.put(ContactWithUSController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBars.appBarDefault(title: "contact_with_us".tr,isBack: true,),
        body: Container(
          // color: Colors.red,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: GetBuilder<ContactWithUSController>(
              builder:(_) =>  Form(
                key: _.globalKey,
                child: Column(
                  children: [
                    24.0.ESH(),
                    TextFieldDefault(
                      hint: 'Email_'.tr,
                      errorText: "error_email_field".tr,
                      controller: _.emailController,
                      keyboardType: TextInputType.text,
                      filledColor: Colors.white,
                      fieldType: FieldType.WithBorder,
                      disableBorder: Colors.transparent,
                      enableBorder: Colors.transparent,
                      horizentalPadding: 16,
                    ),
                    16.0.ESH(),
                    TextFieldDefault(
                      hint: 'text_of_message'.tr,
                      errorText: "error_text_of_message".tr,
                      controller: _.messageController,
                      keyboardType: TextInputType.multiline,
                      filledColor: Colors.white,
                      fieldType: FieldType.WithBorder,
                      disableBorder: Colors.transparent,
                      enableBorder: Colors.transparent,
                      maxLines: 7,
                      horizentalPadding: 16,
                    ),
                    24.0.ESH(),
                    ButtonDefault(
                      title: 'send_'.tr,
                      onTap: () {
                        _.submit();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

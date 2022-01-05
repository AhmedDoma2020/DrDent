import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import '/src/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'تغيير اللغة',),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(
              vertical: 32.h,
              horizontal: 16.w
            ),
            child: Row(
              children: [
                CustomText(
                  text: 'حدد اللغة التي تريد المتابعة في التطبيق من خلاله',
                  color: kCMainBlack2,
                  fontW: FW.semicond,
                  fontSize: 16,
                ),
              ],
            ),
          ),
          languageButton(onTap: (){},active: true),
          16.0.ESH(),
          languageButton(onTap: (){},),
        ],
      ),
    );
  }


  Widget languageButton({required VoidCallback onTap,bool active = false}){
    return GestureDetector(
      onTap:onTap,
      child: Container(
        width: double.infinity,
        color: active?kCSubMain:Colors.white,
        child: Padding(
          padding:  EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: 16.w
          ),
          child: Row(
            children: [
              CustomText(
                text: 'العربية',
                color: active? Colors.white : kCMainBlack2,
                fontSize: 16,
                fontW: FW.medium,
              ),
            ],
          ),
        ),
      ),
    );
  }

}

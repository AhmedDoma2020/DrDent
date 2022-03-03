import 'package:dr_dent/Src/features/StaticFeature/ui/screens/questions_screen.dart';
import 'package:dr_dent/Src/features/StaticFeature/ui/widgets/support_item.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../DrawerFeature/View/Ui/contact_with_mail_screen.dart';
import '/src/core/utils/extensions.dart';


class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'الدعم'),
      body: Column(
        children: [
          32.5.ESH(),
          Image.asset(
            'assets/icons/support.png',
            height: 147.h,
          ),
          32.5.ESH(),
        SupportItem(
            title: 'الأسألة الشائعة',
            subtitle: 'احصل على إجابات لكل استفساراتك فورا',
            icon: 'questionrowitem.png',
            color: Color(0xffBCEBFF),
            onTap: (){
              Get.to(
                QuestionsScreen(),
              );
            },
          ),
          24.0.ESH(),
         // SupportItem(
         //    title: 'خدمة العملاء',
         //    subtitle: 'ابدأ المحادثة الآن',
         //    color: Color(0xffF67956),
         //    icon: 'chatrowitem.png',
         //   onTap: (){},
         //  ),
         //  24.0.ESH(),
          SupportItem(
          title: 'البريد الإلكتروني',
            subtitle: 'ارسل رسالتك ونقوم بالرد عليك على بريدك الإلكتروني',
            icon: 'emailrow.png',
            color: Color(0xff1151D9),
            onTap: (){
            Get.to(()=>ContactWithMail());
            },
          )
        ]
      ),
    );

  }
}

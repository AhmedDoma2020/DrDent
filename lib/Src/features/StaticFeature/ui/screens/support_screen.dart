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
      appBar: AppBars.appBarDefault(title: 'the_support'),
      body: Column(
        children: [
          32.5.ESH(),
          Image.asset(
            'assets/icons/support.png',
            height: 147.h,
          ),
          32.5.ESH(),
        SupportItem(
            title: 'common_questions',
            subtitle: 'Get_answers_to_all_your_questions_instantly',
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
          title: 'Email_',
            subtitle: 'Send_your_message_and_we_will_reply_to_you_on_your_email',
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

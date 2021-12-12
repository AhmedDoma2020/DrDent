// import 'package:flutter/material.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
// import 'package:get/get.dart';
// import 'package:pickup/src/core/constants/color_constants.dart';
// import 'package:pickup/src/features/AuthFeature/bloc/controller/check_phone_controller.dart';
// import 'package:pickup/src/features/AuthFeature/bloc/controller/login_controller.dart';
// import 'package:pickup/src/features/AuthFeature/bloc/controller/verfication_controller.dart';
// import 'package:pickup/src/ui/widgets/GeneralWidgets/custom_text.dart';
// import 'package:pickup/src/ui/widgets/TextFields/text_field_default.dart';
// import 'package:pickup/src/ui/widgets/appbars/app_bars.dart';
// import 'package:pickup/src/ui/widgets/buttons/button_default.dart';
// import 'package:pickup/src/ui/widgets/titles/icon_title_subtitle.dart';
// import 'package:pickup/src/ui/widgets/titles/title_or_row.dart';
// import 'package:pickup/src/ui/widgets/titles/title_subtitle.dart';
// import 'package:pickup/src/ui/widgets/titles/title_tow_in_line.dart';
// import '/src/core/utils/extensions.dart';
//
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class PhoneInputScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     CheckPhoneController checkPhoneController = Get.put(CheckPhoneController());
//     var node = FocusScope.of(context);
//     return Scaffold(
//       appBar: AppBars.appBarDefault(title: 'نسيت كلمة المرور'),
//       backgroundColor: Colors.white,
//       body: GetBuilder<CheckPhoneController>(
//         builder: (_) =>  SingleChildScrollView(
//           child: Column(
//             children: [
//               Form(
//                 key: _.globalKey,
//                 child: Column(
//                   children: [
//                     Padding(
//                         padding:  EdgeInsets.symmetric(
//                             vertical: 32.h
//                         ),
//                         child: IconTitleSubtitle(
//                           icon: 'rset_phone.png',
//                           title: 'من فضلك ادخل رقم الموبيل',
//                           subtitle: 'من فضلك قم بادخال رقم الموبيل الذي سجلت به الحساب حتي يتم ارسال رسالة التاكيد عليه',
//                         )
//                     ),
//                     TextFieldDefault(
//                       hint: 'ادخل رقم الهاتف',
//                       errorText: "يجب ادخال رقم الهاتف",
//                       controller: _.phoneController,
//                       keyboardType: TextInputType.phone,
//                       // validation: phoneValidator,
//                       prefixIconUrl: 'loc',
//                       onComplete: () {
//                         node.nextFocus();
//                       },
//                     ),
//                     50.0.ESH(),
//                     ButtonDefault(
//                       title: 'متابعة',
//                       active: _.phoneNotEmpty,
//                       onTap: (){
//                         _.submit();
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

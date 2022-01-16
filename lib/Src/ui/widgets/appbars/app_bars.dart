import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';

class AppBars {
 static AppBar appBarDefault({ bool isBack=true, TabBar? tabBar,String title='',Widget secondIconImage=const SizedBox(width: 0,) , VoidCallback? onTap}){
   return AppBar(
     title: CustomText(
       text: title,
       fontW: FW.semibold,
       fontSize: 16,
       color: kCBlackTitle,
     ),
     backgroundColor: Colors.white,
     centerTitle: true,
     elevation: 0.0,
     leading:isBack==false?0.0.ESH() :IconButton(
       onPressed: onTap??(){
        Get.back();
       },
       icon: Icon(
         Icons.arrow_back,
         color: kCMainBlack,
         size: 24.h,
       ),
     ),
     actions: [
       secondIconImage

     ],
     bottom: tabBar,
   );
 }
 //
 // static AppBar appBarPost({ bool isBack=true, TabBar? tabBar,String title='',Widget secondIconImage=const SizedBox(width: 0,) , VoidCallback? onTap}){
 //   return AppBar(
 //     title: CustomText(
 //       text: title,
 //       fontW: FW.semibold,
 //       fontSize: 16,
 //       color: kCBlackTitle,
 //     ),
 //     backgroundColor: Colors.white,
 //     centerTitle: true,
 //     elevation: 0.0,
 //     leading:isBack==false?0.0.ESH() :IconButton(
 //       onPressed: onTap??(){
 //        Get.back();
 //       },
 //       icon: Icon(
 //         Icons.arrow_back,
 //         color: kCMainBlack,
 //         size: 24.h,
 //       ),
 //     ),
 //     actions: [
 //       secondIconImage
 //
 //     ],
 //     bottom: tabBar,
 //   );
 // }

static AppBar appBarSkipDefault({ bool isBack=true, TabBar? tabBar,String title='',Widget secondIconImage=const SizedBox(width: 0,) , VoidCallback? onTapBack, VoidCallback? onTapSkip}){
   return AppBar(
     title: CustomText(
       text: title,
       fontW: FW.semibold,
       fontSize: 16,
       color: kCBlackTitle,
     ),
     backgroundColor: Colors.white,
     centerTitle: true,
     elevation: 0.0,
     leading:isBack==false?0.0.ESH() :IconButton(
       onPressed: onTapBack??(){
        Get.back();
       },
       icon: Icon(
         Icons.arrow_back,
         color: kCMainBlack,
         size: 24.h,
       ),
     ),
     actions: [
       IconButton(
         onPressed:onTapSkip,
         icon: CustomText(
           text: "skip_".tr,
           fontW: FW.semibold,
           fontSize: 12,
         ),
       )

     ],
     bottom: tabBar,
   );
 }





 static AppBar appBarLogo({String logo='rect_logo.png'}){
   return AppBar(
     title: Image.asset(
       'assets/icons/$logo',
       height: 33.h,
     ),
     backgroundColor: Colors.white,
     centerTitle: true,
     elevation: 0.0,
   );
 }



}

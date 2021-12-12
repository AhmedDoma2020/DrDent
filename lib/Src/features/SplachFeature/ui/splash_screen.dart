import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/SplachFeature/bloc/controlelr/splach_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          image:DecorationImage(image: AssetImage("assets/image/BGSplash.png"),fit: BoxFit.fill),
        ),
        child: SizedBox(
          height: 112.h,
          width: 218.w,
          child: Center(
            child: Image.asset(
              'assets/image/logo.png',
              height: 112.h,
              width: 218.w,
            ),
          ),
        ),
      ),
    );
  }
}

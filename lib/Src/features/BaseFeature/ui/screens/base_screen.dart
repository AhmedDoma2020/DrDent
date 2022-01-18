import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/BaseFeature/bloc/contoller/base_controller.dart';
import 'package:dr_dent/Src/features/HomeFeature/ui/screens/home_screen.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/screens/jobs_screen.dart';
import 'package:dr_dent/Src/features/SocialFeature/ui/screens/social_screen.dart';
import 'package:dr_dent/Src/features/StoreFeature/ui/screens/stotre_screen.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';


class BaseScreen extends StatelessWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BaseController());
    return GetBuilder<BaseController>(
      builder: (_) =>  Scaffold(
        appBar: AppBars.appBarLogo(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: [
                HomeScreen(),
                JobsScreen(),
                Container(),
                SocialScreen(),
                StoreScreen()
              ][_.tabIndex],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 62.h,
                color: Colors.white,
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 4.w
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center  ,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for(int i=0 ; i<5 ; i++)
                        i==2?
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                          child: GestureDetector(
                            onTap: (){},
                            child: Container(
                              width: 40.w,
                              height: 40.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.r),
                                color: kCActiveDot,
                              ),
                              child: Center(
                                child: Icon(Icons.add,color: Colors.white,size: 14.67.h,),
                              ),
                            ),
                          ),
                        ):
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              _.tabIndex=i;
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Padding(
                                padding:  EdgeInsets.only(
                                  bottom: 2.h
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      color: i==_.tabIndex ? kCMain:Colors.transparent,
                                      width: 40.w,
                                      height:1.h ,
                                    ),
                                    Image.asset(
                                      'assets/icons/${[
                                        'homeTab.png',
                                        'home_job.png',
                                        '',
                                        'home_social.png',
                                        'home_store.png'
                                      ][i]}',
                                      color: i == _.tabIndex ? kCMain:kCMainGrey,
                                      height: 21.h,
                                    ),
                                    CustomText(
                                      text: [
                                        'الرئيسية',
                                        'الوظائف',
                                        '',
                                        'تواصل',
                                        'المتجر',
                                      ][i],
                                      color: i == _.tabIndex ? kCMain:kCMainGrey,
                                      fontW: FW.light,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

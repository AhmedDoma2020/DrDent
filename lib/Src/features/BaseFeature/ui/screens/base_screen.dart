import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/BaseFeature/bloc/contoller/base_controller.dart';
import 'package:dr_dent/Src/features/DrawerFeature/View/Ui/custom_drawer.dart';
import 'package:dr_dent/Src/features/HomeFeature/ui/screens/home_screen.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/sheet_jobs_cities.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/screens/jobs_screen.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Controller/socail_controller.dart';
import 'package:dr_dent/Src/features/SocialFeature/ui/screens/add_post_screen.dart';
import 'package:dr_dent/Src/features/SocialFeature/ui/screens/social_screen.dart';
import 'package:dr_dent/Src/features/StoreFeature/ui/screens/stotre_screen.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../JobFeature/bloc/controller/job_offers_controller.dart';
import '../../../JobFeature/bloc/controller/job_request_controller.dart';
import '/src/core/utils/extensions.dart';


class BaseScreen extends StatelessWidget {
   BaseScreen({Key? key}) : super(key: key);
   final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    debugPrint("BaseScreen1");
    // Get.put(SocialController());
    debugPrint("BaseScreen2");
    Get.put(BaseController());
    Get.put(SocialController());
    JobOffersController _jobOffersController = Get.put(JobOffersController());
    FetchJobRequestController _jobRequestController = Get.put(FetchJobRequestController());
    return GetBuilder<BaseController>(
      builder: (_) =>  Scaffold(
        key: _key,
        drawer:  CustomDrawer(),
        appBar: AppBars.appBarLogo(
          onCitiesTap: (){
            Get.bottomSheet(
              SheetJobsCities(onSave: (id,title){
                Get.back();
                _jobOffersController.fetchJobOffers(cityId: id);
              },),
              isScrollControlled: true
            );
          },
          citiesHandle: _.tabIndex==1,
            onDrawerTap: (){
          _key.currentState!.openDrawer();
        }),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: [
                HomeScreen(),
                JobsScreen(),
                Container(),
                SocialScreen(),
                StoreScreen(),
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
                            onTap: (){
                              debugPrint("ahoooooo");
                              Get.to(()=>AddPostScreen());
                            },
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
                                        'home_',
                                        'jobs_',
                                        '',
                                        'social_',
                                        'store_',
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


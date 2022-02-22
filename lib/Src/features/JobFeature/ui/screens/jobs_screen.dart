import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/controller/job_offers_controller.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/controller/job_request_controller.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/controller/jobs_controller.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/screens/job_offers_screen.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_offer.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_request.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/tabs/tabs_ios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';
import 'add_a_job_offer_screen.dart';
import 'job_requests_screen.dart';



class JobsScreen extends StatelessWidget {
  const JobsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(JobsController());
    JobOffersController _jobOffersController= Get.put(JobOffersController());
    Get.put(JobRequestController());
    Future<void> onRefresh()async {
      await _jobOffersController.fetchJobOffers();
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24.w,
        ),
        onPressed: () {
          Get.to(()=> AddAJopOfferScreen());
        },
        backgroundColor: kCMain,
      ),
      body: GetBuilder<JobsController>(
          builder: (_) {
            return RefreshIndicator(
            onRefresh:onRefresh ,
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 16.h),
                    child: Center(child: TabsIos(titles: const ['طلبات توظيف','فرص العمل'], onTap: (value){_.tabIndex=value;},tabIndex: _.tabIndex,)),
                  ),
                  Expanded(
                      child: [
                        const JobRequestScreen(),
                        const JobOffersScreen(),
                      ][_.tabIndex]
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}

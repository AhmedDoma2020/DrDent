import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/MyCertificationFeature/Bloc/Controller/add_doctor_certification_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/MyCertificationFeature/Bloc/Controller/delete_doctor_certification_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/MyCertificationFeature/Bloc/Controller/fetch_doctor_certification_controller.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/EmptyWidget/empty_widget.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../Widget/certification_image_form.dart';

class CertificationOfDoctorScreen extends StatelessWidget {
  CertificationOfDoctorScreen({Key? key}) : super(key: key);

  final List<String> testList = [
    'https://images.pexels.com/photos/6558304/pexels-photo-6558304.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/3104176/pexels-photo-3104176.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/7539543/pexels-photo-7539543.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/3130928/pexels-photo-3130928.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  ];

  @override
  Widget build(BuildContext context) {
    FetchDoctorCertificationController _fetchDoctorCertificationController =
        Get.put(FetchDoctorCertificationController());
    AddDoctorCertificationController _addDoctorCertificationController =
        Get.put(AddDoctorCertificationController());
    Get.put(DeleteDoctorCertificationController());
    Future<void> onRefresh() async {
      await _fetchDoctorCertificationController.fetchCertification();
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: GetBuilder<FetchDoctorCertificationController>(
        builder: (_) => Scaffold(
          appBar: AppBars.appBarDefault(
            title: "my_certification".tr,
            onTap: () {
              Get.back();
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 24.w,
            ),
            onPressed: () {
              _addDoctorCertificationController.getImages();
            },
            backgroundColor: kCMain,
          ),
          body: _.status == RequestStatus.loading
              ? Center(
                  child: Loader(),
                )
              : _.certificationList.isEmpty
                  ? EmptyWidget(
                      image: "assets/image/EmptyDetectionLocationDetails.png",
                      title: "no_certification_yet_title".tr,
                      subTitle: "no_certification_yet_sup_title".tr,
                      onTapButton: () {},
                      availableButton: false,
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 24.h),
                      height: double.infinity,
                      child: SingleChildScrollView(
                        child: StaggeredGrid.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8.h,
                          crossAxisSpacing: 8.w,
                          children: _.certificationList
                              .map(
                                (e) => CertificationImageForm(
                                  onDelete:
                                      _.snackBarStatus == SnackbarStatus.CLOSED
                                          ? () {
                                              _.deleteCertification(
                                                  certificationId: e.id!);
                                            }
                                          : () {},
                                  image: e.image!,
                                ),
                              )
                              .toList(),
                        ),
                      ),

                      // GridView.builder(
                      //   shrinkWrap: true,
                      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 3,
                      //     // childAspectRatio: 1.06,
                      //     crossAxisSpacing: 16.w,
                      //     mainAxisSpacing: 18.h,
                      //   ),
                      //   itemBuilder: (context, index) => CertificationImageForm(
                      //     onDelete:  _.snackBarStatus == SnackbarStatus.CLOSED? () {
                      //       _.deleteCertification(
                      //           certificationId:
                      //               _.certificationList[index].id!);
                      //     }:(){},
                      //     image: _.certificationList[index].image!,
                      //   ),
                      //   itemCount: _.certificationList.length,
                      // ),
                    ),
        ),
      ),
    );
  }
}

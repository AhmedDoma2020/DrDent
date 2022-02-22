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
  @override
  Widget build(BuildContext context) {
    Get.put(FetchDoctorCertificationController());
    AddDoctorCertificationController _addDoctorCertificationController =
        Get.put(AddDoctorCertificationController());
    DeleteDoctorCertificationController _deleteDoctorCertificationController =
        Get.put(DeleteDoctorCertificationController());
    return SafeArea(
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
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                      height: 400.h,
                      child:
                      // MasonryGridView.count(
                      //   crossAxisCount: 2,
                      //   mainAxisSpacing: 4,
                      //   crossAxisSpacing: 1,
                      //
                      //   itemBuilder: (context, index) => CertificationImageForm(
                      //     onDelete: _.snackBarStatus == SnackbarStatus.CLOSED
                      //         ? () {
                      //             _.deleteCertification(
                      //                 certificationId:
                      //                     _.certificationList[index].id!);
                      //           }
                      //         : () {},
                      //     image: _.certificationList[index].image!,
                      //   ),
                      //   itemCount: _.certificationList.length,
                      // ),

                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          // childAspectRatio: 1.06,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 18.h,
                        ),
                        itemBuilder: (context, index) => CertificationImageForm(
                          onDelete:  _.snackBarStatus == SnackbarStatus.CLOSED? () {
                            _.deleteCertification(
                                certificationId:
                                    _.certificationList[index].id!);
                          }:(){},
                          image: _.certificationList[index].image!,
                        ),
                        itemCount: _.certificationList.length,
                      ),
                    ),
        ),
      ),
    );
  }
}

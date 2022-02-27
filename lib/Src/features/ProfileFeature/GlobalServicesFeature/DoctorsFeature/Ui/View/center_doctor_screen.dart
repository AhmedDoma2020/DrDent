import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Bloc/Controller/fetch_center_doctor_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Ui/Widget/center_doctor_widget.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/EmptyWidget/empty_widget.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'add_center_doctor_screen.dart';

class MyDoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    FetchCenterDoctorController _fetchCenterDoctorController =
        Get.put(FetchCenterDoctorController(centerId: box.read('id') ?? 0));
    Future<void> onRefresh() async {
      await _fetchCenterDoctorController.fetchCenterDoctor();
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 24.w,
          ),
          onPressed: () {
            Get.to(() => AddCenterDoctorScreen(isEdit: false,));
          },
          backgroundColor: kCMain,
        ),
        appBar: AppBars.appBarDefault(
            title: "center_doctors".tr,
            onTap: () {
              Get.back();
            }),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: GetBuilder<FetchCenterDoctorController>(
            builder: (_) => _.status == RequestStatus.loading
                ? Center(
                    child: Loader(),
                  )
                : _.centerDoctorList.isEmpty
                    ? EmptyWidget(
                        image: "assets/image/emptyDoctor.png",
                        onTapButton: () {},
                        availableButton: false,
                        title: "empty_doctor_title".tr,
                        spaceBetweenTitleAndSubTitle: 4,
                        subTitle: "empty_doctor_title_subtitle".tr,
                        imageH: 124,
                        imageW: 200,
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Column(
                          children: [
                            16.0.ESH(),
                            CenterDoctorWidget(
                              // indexOfCenterOfDoctor: index ,
                              doctor: _.centerDoctorList[index],
                              onEditTap: () {
                                Get.to(() => AddCenterDoctorScreen(
                                  isEdit:true,
                                  centerDoctorModel: _.centerDoctorList[index],
                                ));
                              },
                              onDeleteTap: _.snackBarStatus == SnackbarStatus.CLOSED? () {
                                _.deleteCenterDoctor(
                                    doctorId:
                                        _.centerDoctorList[index].id);
                              }:(){},
                            ),
                            16.0.ESH(),
                          ],
                        ),
                        itemCount: _.centerDoctorList.length,
                      ),
          ),
        ),
      ),
    );
  }
}

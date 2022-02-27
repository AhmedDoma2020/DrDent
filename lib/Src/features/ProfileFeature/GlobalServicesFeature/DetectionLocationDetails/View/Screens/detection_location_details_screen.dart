import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/Bloc/Controller/featch_detection_location_details_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/View/Screens/set_detection_location_details_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/View/Widget/detection_location_details_widget.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/controller/work_time_controller.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/screens/work_time_screen.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/EmptyWidget/empty_widget.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetectionLocationDetailsScreen extends StatelessWidget {
  final String appBarTitle;
  final UserTypeEnum userType;

  DetectionLocationDetailsScreen(
      {this.appBarTitle = "Detection_location_details",
      required this.userType});

  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    FetchWorkSpaceDetailsController _fetchWorkSpaceDetailsController =
        Get.put(FetchWorkSpaceDetailsController());
    Future<void> onRefresh() async {
      await _fetchWorkSpaceDetailsController.fetchMyWorkSpaceDetails();
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
            Get.to(() => SetDetectionLocationDetailsScreen(
                  isAuth: false,
                ));
          },
          backgroundColor: kCMain,
        ),
        appBar: AppBars.appBarDefault(
            title: appBarTitle.tr,
            onTap: () {
              Get.back();
            }),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: GetBuilder<FetchWorkSpaceDetailsController>(
              builder: (_) => _.status == RequestStatus.loading
                  ? Center(
                      child: Loader(),
                    )
                  : _.myWorkSpaceDetails.isEmpty
                      ? EmptyWidget(
                          image:
                              "assets/image/EmptyDetectionLocationDetails.png",
                          onTapButton: () {},
                          availableButton: false,
                          title: "Empty_Detection_location_details".tr,
                          imageH: 160,
                          imageW: 140,
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              DetectionLocationDetailsWidget(
                            model: _.myWorkSpaceDetails[index],
                            onEditTap: () {
                              Get.to(
                                () => SetDetectionLocationDetailsScreen(
                                  isEdit: true,
                                  isAuth: false,
                                  workSpace: _.myWorkSpaceDetails[index],
                                ),
                              );
                            },
                            onTimeTap: () {
                              Get.to(
                                () => WorkTimeScreen(
                                  isEdit:true,
                                  userType: userType,
                                  isBack: true,
                                  doctorId: box.read('id'),
                                  onSuccess: () {
                                    Get.back();
                                  },
                                  workspaceId: _.myWorkSpaceDetails[index].id,
                                  fetchDayBooking: _.myWorkSpaceDetails[index].dayBooking,
                                  fetchDetectionTime: _.myWorkSpaceDetails[index].detectionTime,
                                ),
                              );
                            },
                            onDeleteTap:
                                _.snackBarStatus == SnackbarStatus.CLOSED
                                    ? () {
                                        debugPrint(
                                            "on tap delete ${_.myWorkSpaceDetails[index].id}");
                                        _.deleteMyDetectionLocationDetails(
                                            detectionId:
                                                _.myWorkSpaceDetails[index].id);
                                      }
                                    : () {},
                          ),
                          separatorBuilder: (context, index) => 16.0.ESH(),
                          itemCount: _.myWorkSpaceDetails.length,
                        ),
            ),
          ),
        ),
      ),
    );
  }
}

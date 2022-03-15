import 'package:dr_dent/Src/bloc/model/center_doctor_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/Bloc/Controller/featch_detection_location_details_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/View/Widget/available_work_space_sheet.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Bloc/Controller/featch_job_title_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Bloc/Controller/fetch_center_doctor_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Ui/Widget/row_times_of_center_doctor_form.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Ui/Widget/work_spaces_of_center_doctor_form.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/controller/work_time_controller.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/screens/work_time_screen.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/delete_widget.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/icon_widget.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'job_title_button_sheet.dart';

class CenterDoctorWidget extends StatefulWidget {
  final CenterDoctorModel doctor;
  final VoidCallback onDeleteTap;
  final VoidCallback onEditTap;

  const CenterDoctorWidget({
    required this.doctor,
    required this.onDeleteTap,
    required this.onEditTap,
    Key? key,
  }) : super(key: key);

  @override
  State<CenterDoctorWidget> createState() => _CenterDoctorWidgetState();
}

class _CenterDoctorWidgetState extends State<CenterDoctorWidget> {
  bool isOpen = false;
int workSpaceIdSelected = 0;
  @override
  Widget build(BuildContext context) {
    FetchCenterDoctorController _fetchCenterDoctorController =  Get.find();

    Get.put(FetchJobTitleController());
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      // height: 134.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: kCOffWight,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(777.r),
                    child: Container(
                      // color: Colors.white,
                      height: 64.h,
                      width: 64.h,
                      child: Center(
                        child: ImageNetwork(
                          url: widget.doctor.image,
                          height: 64.w,
                          width: 64.w,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          constraints:
                              BoxConstraints(maxWidth: 160.w, minWidth: 120.w),
                          // color: Colors.yellow,
                          child: CustomText(
                            text: widget.doctor.name,
                            fontSize: 14,
                            fontW: FW.semibold,
                          )),
                      8.0.ESH(),
                      Container(
                          // width: 200.w,
                          constraints:
                              BoxConstraints(maxWidth: 160.w, minWidth: 120.w),
                          // color: Colors.yellow,
                          child: CustomText(
                            text: widget.doctor.specialization.isEmpty
                                ? "no_Specialization".tr
                                : widget.doctor.specializationTitle,
                            fontSize: 14,
                            fontW: FW.semibold,
                          )),
                      8.0.ESH(),
                      Row(
                        children: [
                          ImageIcon(
                            const AssetImage("assets/icons/moneys.png"),
                            color: kCSubMain,
                            size: 14.w,
                          ),
                          8.0.ESW(),
                          Container(
                            // constraints: BoxConstraints(minWidth: 100.w),
                              constraints: BoxConstraints(maxWidth: 100.w, minWidth: 80.w),
                              // color: Colors.yellow,
                              child: CustomText(
                                text: "${"price_examination".tr}:",
                                fontSize: 12,
                                fontW: FW.semibold,
                              )),
                          Container(
                              // width: 200.w,
                              constraints: BoxConstraints(
                                  maxWidth: 60.w, minWidth: 40.w),
                              // color: Colors.yellow,
                              child: CustomText(
                                text: widget.doctor.price.toString(),
                                fontSize: 12,
                                fontW: FW.semibold,
                              )),
                        ],
                      ),
                      8.0.ESH(),
                      Row(
                        children: [
                          ImageIcon(
                            const AssetImage("assets/icons/GPhone.png"),
                            color: kCSubMain,
                            size: 14.w,
                          ),
                          8.0.ESW(),
                          Container(
                              // width: 200.w,
                              constraints: BoxConstraints(
                                  maxWidth: 200.w, minWidth: 120.w),
                              // color: Colors.yellow,
                              child: CustomText(
                                text: widget.doctor.phone,
                                fontSize: 12,
                                fontW: FW.semibold,
                              )),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconWidget(onEditTap: widget.onEditTap),
                      DeleteWidget(onDeleteTap: widget.onDeleteTap),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isOpen = !isOpen;
                    });
                  },
                  child: Container(
                    // color: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                    child: CustomText(
                      text: isOpen ? "show_less".tr : "show_more".tr,
                      color: isOpen ? kCMainGrey : kCMain,
                      fontW: FW.semibold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          isOpen
              ? Container(
                  // height: 300,
                  // color: Colors.tealAccent,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.0.ESH(),
                      const Divider(
                        height: 1.5,
                        color: kCMainGrey,
                      ),
                      14.0.ESH(),
                      CustomText(
                        text: "info_about_doctor".tr,
                        fontW: FW.demi,
                      ),
                      8.0.ESH(),
                      CustomText(
                        text: widget.doctor.doctorInfo,
                        fontSize: 12,
                      ),
                      24.0.ESH(),
                      CustomText(
                        text: "jop_time".tr,
                        fontW: FW.demi,
                      ),
                      14.0.ESH(),
                      widget.doctor.workspaces.isEmpty
                          ? 0.0.ESH()
                          : ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  WorkSpacesOfCenterDoctorForm(
                                    fetchDetectionTime:  widget.doctor.workspaces[index].detectionTime,
                                dayBookingTypeEdit:  widget.doctor.workspaces[index].reservationType,
                                workSpaceName: widget.doctor.workspaces[index].name,
                                days: widget.doctor.workspaces[index].days,

                                workSpaceId: widget.doctor.workspaces[index].id,
                                doctorId: widget.doctor.id,
                              ),
                              separatorBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                child: Divider(
                                  height: 1.5.h,
                                  color: kCMainGrey,
                                ),
                              ),
                              itemCount: widget.doctor.workspaces.length,
                            ),
                      14.0.ESH(),
                      GestureDetector(
                        onTap: () {
                          debugPrint("open sheet");
                          Get.bottomSheet(
                              AvailableWorkSpaceSheet(
                                onSelected: (id,title){
                                  setState(() {
                                    debugPrint("workspaceId in onSelected fun is $id");
                                    workSpaceIdSelected = id;
                                  });
                                },
                                onContainTap: (){
                                  Get.back();
                                  Get.to(
                                    WorkTimeScreen(
                                    userType: UserTypeEnum.doctor,
                                    isEdit: true,
                                    // dayBookingTypeEdit: widget.doctor.workspaces[],
                                    onSuccess:(){
                                      Get.back();
                                      _fetchCenterDoctorController.fetchCenterDoctor();
                                    },
                                    workspaceId: workSpaceIdSelected,
                                    doctorId: widget.doctor.id,
                                    isBack: true,
                                  ),);
                                },
                              ),
                              isScrollControlled: true);

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: kCMain, width: 1),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 9.h, horizontal: 21.w),
                            child: Center(
                              child: CustomText(
                                text: 'إضافة  فترة',
                                color: kCMain,
                                fontW: FW.medium,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                )
              : 0.0.ESH(),
        ],
      ),
    );
  }
}

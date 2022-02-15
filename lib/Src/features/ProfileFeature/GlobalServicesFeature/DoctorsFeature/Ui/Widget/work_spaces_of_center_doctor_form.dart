import 'package:dr_dent/Src/bloc/model/center_doctor_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Bloc/Controller/fetch_center_doctor_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Ui/Widget/row_times_of_center_doctor_form.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/controller/work_time_controller.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/screens/work_time_screen.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/edit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WorkSpacesOfCenterDoctorForm extends StatelessWidget {
  final String workSpaceName;
  final int workSpaceId;
  final int doctorId;
  final List<Days> days;

  const WorkSpacesOfCenterDoctorForm({
    required this.workSpaceName,
    required this.workSpaceId,
    required this.doctorId,
    required this.days,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FetchCenterDoctorController _fetchCenterDoctorController =  Get.find();
    return Container(
      width: double.infinity,
      // color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ImageIcon(const AssetImage("assets/icons/examination_and_clinic_data.png"),color: kCSubMain,size: 24.h,),
                  8.0.ESW(),
                  SizedBox(
                    width: 188.w,
                    child: CustomText(
                      text: workSpaceName,
                      fontW: FW.semibold,
                      overflow: true,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              IconWidget(onEditTap: (){
                Get.to(WorkTimeScreen(
                  userType: UserTypeEnum.doctor,
                  onSuccess:(){
                    Get.back();
                    _fetchCenterDoctorController.fetchCenterDoctor();
                  },
                  workspaceId:workSpaceId,
                  doctorId: doctorId,
                  isBack: true,

                ),);
              },icon: "assets/icons/timeIcon.png",)
            ],
          ),
          14.0.ESH(),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => TimesOfCenterDoctorForm(
              day: days[index].title,
              times: days[index].times,
            ),
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Divider(
                height: 1.5.h,
                color: kCMainGrey,
              ),
            ),
            itemCount: days.length,
          ),
        ],
      ),
    );
  }
}

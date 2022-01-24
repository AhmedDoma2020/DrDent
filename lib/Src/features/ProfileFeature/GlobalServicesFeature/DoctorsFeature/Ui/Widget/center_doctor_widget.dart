import 'package:dr_dent/Src/bloc/model/center_doctor_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Ui/Widget/row_times_of_center_doctor_form.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/delete_widget.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/edit_widget.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

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
  @override
  Widget build(BuildContext context) {
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
                  6.0.ESW(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          constraints:
                              BoxConstraints(maxWidth: 144.w, minWidth: 120.w),
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
                              BoxConstraints(maxWidth: 144.w, minWidth: 120.w),
                          // color: Colors.yellow,
                          child: CustomText(
                            text: widget.doctor.specialization.join(","),
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
                              // width: 40.w,
                              constraints: BoxConstraints(maxWidth: 60.w, minWidth: 50.w),
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
                                text: widget.doctor.price,
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
                      EditWidget(onEditTap: widget.onEditTap),
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
          isOpen ?
          Container(
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
                  text:widget.doctor.doctorInfo,
                  fontSize: 12,
                ),
                24.0.ESH(),
                CustomText(
                  text: "jop_time".tr,
                  fontW: FW.demi,
                ),
                14.0.ESH(),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => TimesOfCenterDoctorForm(
                    day: widget.doctor.dates[index].dayTitle,
                    times: widget.doctor.dates[index].times,
                  ),
                  separatorBuilder: (context, index) =>  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 15.h),
                    child:  Divider(
                      height: 1.5.h,
                      color: kCMainGrey,
                    ),
                  ),
                  itemCount: widget.doctor.dates.length,
                )
              ],
            ),
          ): 0.0.ESH(),
        ],
      ),
    );
  }
}

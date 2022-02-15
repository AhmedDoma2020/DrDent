import 'package:dr_dent/Src/bloc/model/center_doctor_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/delete_widget.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/edit_widget.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'item_in_row_times_of_center_doctor_form.dart';

class TimesOfCenterDoctorForm extends StatelessWidget {
  const TimesOfCenterDoctorForm({

     required this.times,
     required this.day,
    Key? key,
  }) : super(key: key);
  final List<Times> times;
  final String day;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 74.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: day,
            fontW: FW.demi,
          ),
          6.0.ESH(),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => SizedBox(
              // height: 40.h,
              width: double.infinity,
              child: Padding(
                 padding:  EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemInRowTimesOfCenterDoctorForm(
                      icon: "assets/icons/beginningOfThePeriod.png",
                      title: "beginning_of_the_period",
                      subTitle: times[index].startTime,
                    )
                    ,ItemInRowTimesOfCenterDoctorForm(
                      icon: "assets/icons/endingOfThePeriod.png",
                      title: "ending_of_the_period",
                      subTitle: times[index].endTime,
                    )
                    ,ItemInRowTimesOfCenterDoctorForm(
                      icon: "assets/icons/group.png",
                      title: "number_of_emergency_bookings",
                      subTitle: times[index].emergencyBookings.toString(),
                    ),
                  ],
                ),
              ),
            ),
            // separatorBuilder: (context, index) =>  Padding(
            //   padding:  EdgeInsets.symmetric(vertical: 15.h),
            //   child:  Divider(
            //     height: 1.5.h,
            //     color: kCMainGrey,
            //   ),
            // ),
            itemCount: times.length,
          ),

        ],
      ),
    );
  }
}

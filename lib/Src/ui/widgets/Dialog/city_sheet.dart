
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import '../../../features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/Bloc/Controller/set_detection_location_details_controller.dart';
import 'package:dr_dent/Src/features/LocationFeature/ui/bloc/Controller/set_location_sheet_controller.dart';
import 'package:dr_dent/Src/features/LocationFeature/ui/bloc/Model/city_model.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/row_top_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';

class CityButtonSheet extends StatelessWidget {
  final List<CityModel> cityList;
  // final VoidCallback onTap;

  const CityButtonSheet({
    Key? key,
    required this.cityList,
    stateIndex,
    // required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(19.r),
          topRight: Radius.circular(19.r),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          width: double.infinity,
          height: 500.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(19.r),
                topRight: Radius.circular(19.r),
              ),
              color: Colors.white),
          child: GetBuilder<SetDetectionLocationDetailsController>(
            builder: (_) => Column(
              children: [
                24.0.ESH(),
                RowTopBottomSheet(
                  title: "city_".tr,
                  isClose: false,
                ),
                24.0.ESH(),
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        debugPrint("xxxxxxxxxxxxxxxxxxxxxxx");
                        _.cityController!.text = cityList[index].title;
                        Get.back();
                      },
                      child: CityOrAreaRowForm(
                        cityName: cityList[index].title,
                      )),
                  separatorBuilder: (context, index) => Divider(
                    height: 2.h,
                    color: kCTFEnableBorder,
                  ),
                  itemCount: cityList.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class CityOrAreaRowForm extends StatelessWidget {
  final String cityName;

  const CityOrAreaRowForm({
    required this.cityName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: CustomText(
        text: cityName,
        fontW: FW.semibold,
        fontSize: 24.sp,
      ),
    );
  }
}
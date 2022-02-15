import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/Bloc/Controller/featch_detection_location_details_controller.dart';
import 'package:dr_dent/Src/ui/widgets/Choses/single_chose_row_form.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/row_top_bottom_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/src/core/utils/extensions.dart';

class AvailableWorkSpaceSheet extends StatelessWidget {
  final Function(int, String) onSelected;
  final VoidCallback onContainTap;

  AvailableWorkSpaceSheet({
    required this.onSelected,
    required this.onContainTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FetchWorkSpaceDetailsController());
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
          child: GetBuilder<FetchWorkSpaceDetailsController>(
            builder: (_) => Column(
              children: [
                24.0.ESH(),
                RowTopBottomSheet(
                  title: "select_branch".tr,
                  isClose: false,
                ),
                24.0.ESH(),
                SizedBox(
                  height: 360.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                      onTap: _.myWorkSpaceDetails[index].isSelected
                          ? () {}
                          : () {
                              _.changeSIndex(index);
                              onSelected(
                                _.myWorkSpaceDetails[index].id,
                                _.myWorkSpaceDetails[index].name,
                              );
                              debugPrint("workspaceId in sheet is ${_.myWorkSpaceDetails[index].id}");

                        // setServiceType.servicesTypeSelectedController!.text = _.availableServicesList[index].title.toString();
                              // setServiceType.setServicesId = _.availableServicesList[index].id;
                              // Get.back();
                            },
                      child: SingleChoseRowForm(
                        title: _.myWorkSpaceDetails[index].name,
                        isSelected: _.indexSelected == index,
                      ),
                    ),
                    separatorBuilder: (context, index) => Divider(
                      height: 2.h,
                      color: kCTFEnableBorder,
                    ),
                    itemCount: _.myWorkSpaceDetails.length,
                  ),
                ),
                _.indexSelected == -1?0.0.ESH():
                ButtonDefault(
                  title: "contain_".tr,
                  onTap: onContainTap,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

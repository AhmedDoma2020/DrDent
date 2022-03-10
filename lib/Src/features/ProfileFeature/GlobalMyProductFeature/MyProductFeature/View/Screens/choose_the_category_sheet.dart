import 'package:dr_dent/Src/bloc/controller/featch_state_and_city_controller.dart';
import 'package:dr_dent/Src/bloc/model/state_and_city_model.dart';
import 'package:dr_dent/Src/bloc/model/univeristy_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalMyProductFeature/MyProductFeature/Bloc/Controller/fetch_categories_controller.dart';
import 'package:dr_dent/Src/ui/widgets/Choses/single_chose_row_form.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/row_top_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/src/core/utils/extensions.dart';

class CategoryButtonSheet extends StatelessWidget {
  final Function(int, String) onTap;

  const CategoryButtonSheet({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              24.0.ESH(),
              RowTopBottomSheet(
                title: "choose_the_category".tr,
                isClose: false,
              ),
              24.0.ESH(),
              GetBuilder<FetchCategoriesController>(
                builder: (_) => SizedBox(
                  height: 400.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        _.changeChoiceIndex(index);
                        onTap(
                          _.categories[index].id,
                          _.categories[index].title,
                        );
                        Get.back();
                      },
                      child: SingleChoseRowForm(
                        title: _.categories[index].title,
                        isSelected: _.choiceSIndex == index,
                      ),
                    ),
                    separatorBuilder: (context, index) => Divider(
                      height: 2.h,
                      color: kCTFEnableBorder,
                    ),
                    itemCount: _.categories.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

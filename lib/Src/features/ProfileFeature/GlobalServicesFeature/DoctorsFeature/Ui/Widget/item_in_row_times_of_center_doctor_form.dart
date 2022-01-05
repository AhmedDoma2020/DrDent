import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';



class ItemInRowTimesOfCenterDoctorForm extends StatelessWidget {
  const ItemInRowTimesOfCenterDoctorForm({
    required this.icon,
    required this.title,
    required this.subTitle,
    Key? key,
  }) : super(key: key);
final String icon;
final String title;
final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox(
                width: 14.w,
                height: 14.w,
                child: ImageIcon(
                  AssetImage(icon),
                  color: kCMainGrey,
                  size: 14.w,
                )),
            6.0.ESW(),
            CustomText(text: title.tr,fontSize: 12,fontW: FW.light,),
          ],
        ),
        2.0.ESH(),
        CustomText(text: subTitle.tr,fontSize: 14,fontW: FW.medium,),
      ],
    );
  }
}

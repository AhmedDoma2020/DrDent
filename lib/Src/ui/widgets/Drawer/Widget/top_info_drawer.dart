import 'package:flutter/material.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/avatar_form.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class TopInfoDrawer extends StatelessWidget {
  const TopInfoDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        24.0.ESH(),
        AvatarForm(
          onTap: (val) {},
          isUploade: false,
        ),
        18.0.ESH(),
        Container(
          width: 200.w,
          // color: Colors.white,
          child: CustomText(
            text: "DR.Ahmed Doma",
            fontSize: 16,
            fontW: FW.demi,
          ),
        ),
        1.0.ESH(),
        Row(
          children: [
            Container(
                width: 180.w,
                // color: Colors.white,
                child: CustomText(
                  text: "DR.Ahmed Doma",
                  fontSize: 10,
                  fontW: FW.light,
                )),
            20.0.ESW(),
            IconButton(
              // color: Colors.white,
              // disabledColor: Colors.red,
              onPressed: () {},
              icon: CustomText(
                text: "تغير".tr,
                fontSize: 12,
                fontW: FW.medium,
                color: kCMain,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

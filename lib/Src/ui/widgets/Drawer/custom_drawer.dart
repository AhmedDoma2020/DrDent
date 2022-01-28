import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/avatar_form.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          // color: Colors.amber,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: const TopInfoDrawer(),
              ),
              Divider(
                height: 2.h,
                color: kCMainGrey,
              ),
              14.0.ESH(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(4.
                      onTap: (){
                        print("abc");
                      },
                      highlightColor: kCSubMain.withOpacity(.1),
                      // focusColor: kCSubMain,
// hoverColor: kCSubMain,

                    splashColor: kCSubMain.withOpacity(.2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          height: 42.h,
                          width: double.infinity,
                          // color: Colors.white,
                          child: Row(
                            children: [
                              ImageIcon(
                                const AssetImage(
                                    "assets/icons/personalInfoIcon.png"),
                                color: kCIconBlueBlack,
                                size: 20.h,
                              ),
                              14.0.ESW(),
                              CustomText(
                                text: 'title',
                                fontW: FW.medium,
                                color: kCIconBlueBlack,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
          color: Colors.white,
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
                color: Colors.white,
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

import 'package:flutter/material.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/avatar_form.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';

class TopInfoDrawer extends StatelessWidget {
   TopInfoDrawer({
    Key? key,
  }) : super(key: key);
GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    debugPrint("box.read('image') ${box.read('image')}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        24.0.ESH(),
        SizedBox(
          height: 80.w,
          width: 80.w,
          child: AvatarForm(
            futureImage: box.read('image')??"",
            onTap: (val) {},
            isUpload: false,
          ),
        ),
        18.0.ESH(),
        Container(
          width: 200.w,
          // color: Colors.white,
          child: CustomText(
            text: box.read('name')??"",
            fontSize: 16,
            fontW: FW.demi,
          ),
        ),
        1.0.ESH(),
        // Row(
        //   children: [
        //     Container(
        //         width: 180.w,
        //         // color: Colors.white,
        //         child: CustomText(
        //           text: box.read('name')??"",
        //           fontSize: 10,
        //           fontW: FW.light,
        //         )),
        //     20.0.ESW(),
        //     IconButton(
        //       // color: Colors.white,
        //       // disabledColor: Colors.red,
        //       onPressed: () {},
        //       icon: CustomText(
        //         text: "تغير".tr,
        //         fontSize: 12,
        //         fontW: FW.medium,
        //         color: kCMain,
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}

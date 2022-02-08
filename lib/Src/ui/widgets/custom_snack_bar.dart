import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'GeneralWidgets/custom_text.dart';

void customSnackBar({String title = '', String subtitle = '',void Function(SnackbarStatus?)? snackBarStatus}) {
  Get.snackbar(
    '',
    '',
    backgroundColor: kCMainBlack,
    snackPosition: SnackPosition.TOP,
    titleText: CustomText(
      text: title,
      color: Colors.white,
      fontW: FW.bold,
      fontSize: 15,
    ),
    messageText: CustomText(
      text: subtitle,
      color: Colors.white,
      fontW: FW.medium,
      fontSize: 12,
    ),
    snackbarStatus: snackBarStatus,
  );
}

import 'dart:async';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/verify_phone_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/log_out_repo.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class LogOutController extends GetxController{

  final LogOutRepository _logOutRepository = LogOutRepository();
  GetStorage box = GetStorage();

  Future<void> logOut() async {
  box.remove("log_in");
  Get.offAll(()=>LoginScreen());
  await _logOutRepository.logOut();
    box.erase();
}

}
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/change_password_repo.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/reset_password_repo.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/login_screen.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  TextEditingController? newPasswordController;
  TextEditingController? confirmNewPasswordController;
  TextEditingController? oldPasswordController;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final ChangePasswordRepository _changePasswordRepository =
      Get.put(ChangePasswordRepository());

  void submit() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      setLoading();
      var response = await _changePasswordRepository.changePassword(
          newPassword: newPasswordController!.text,
          oldPassword: oldPasswordController!.text);
      Get.back();
      if (response.statusCode == 200 && response.data["status"] == true) {
        Get.offAll(() => LoginScreen());
        customSnackBar(
          title: response.data['message'] ?? "",
        );
      } else {
        customSnackBar(
          title: response.data['message'] ?? "",
        );
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    oldPasswordController?.dispose();
    newPasswordController?.dispose();
    confirmNewPasswordController?.dispose();
    super.dispose();
  }
}

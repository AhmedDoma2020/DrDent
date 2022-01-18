import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/start_now_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/wating_screen.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/set_work_license_repo.dart';

class SetWorkLicenseController extends GetxController {
  final SetWorkLicenseRepository _setWorkLicenseRepository =
      SetWorkLicenseRepository();

  void submit() async {
    // print("img64 $img64");
    if (img64 != null) {
      setLoading();
      var response =
          await _setWorkLicenseRepository.setWorkLicense(workLicense: img64!);
      Get.back();
      update();
      if (response.statusCode == 200 && response.data["status"] == true) {
        Get.to(() => StartNowScreen());
        // Get.to(() => WattingScreen());
      } else {}
    } else {
      customSnackBar(title: "must_set_photo_of_Work_licenses".tr);
    }
  }

  File? image;
  String? img64;
  // Uint8List? bytes2;
  String? photoView;

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      update();
      final bytes = File(image.path).readAsBytesSync();
      img64 = base64Encode(bytes);
      // bytes2 = const Base64Decoder().convert(img64!);
    } on PlatformException catch (e) {
      print("field picked image $e");
    }
  }
}

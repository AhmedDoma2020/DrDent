import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/start_now_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/wating_screen.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/set_work_license_repo.dart';

class SetWorkLicenseController extends GetxController {
  final SetWorkLicenseRepository _setWorkLicenseRepository = SetWorkLicenseRepository();
  GetStorage box = GetStorage();
  void submit() async {
    // debugPrint("img64 $img64");
    if (img64 != null) {
      box.remove('work_lisence');
      setLoading();
      var response = await _setWorkLicenseRepository.setWorkLicense(workLicense: img64!);
      Get.back();
      update();
      if (response.statusCode == 200 && response.data["status"] == true) {
        box.write('work_lisence', response.data['work_lisence']);
        debugPrint('work_lisence in controller is ${box.read('work_lisence')}');
        Get.offAll(() => StartNowScreen());
        customSnackBar(title: response.data
        ['message']??"");
        // Get.to(() => WattingScreen());
      } else {
        customSnackBar(title: response.data['message']??"");
      }
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
      debugPrint("field picked image $e");
    }
  }
}

import 'dart:developer';

import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_profile_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Repo/set_avatar_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

class SetAvatarController extends GetxController {

  RequestStatus status = RequestStatus.initial;
  final FetchProfileController _fetchProfileController = Get.put(FetchProfileController());

  final  SetAvatarRepository _setAvatarRepository =SetAvatarRepository();
  Future<void> setAvatar({required String image}) async {
    log("avatar $image");
    setLoading();
      var response = await _setAvatarRepository.setAvatar(image: image);
      Get.back();
      if (response.statusCode == 200 && response.data["status"] == true) {
        debugPrint("request operation success");
        _fetchProfileController.fetchProfileDoctor();
        customSnackBar(title: response.data["message"]??"Done");
        debugPrint("convert operation success");
        status = RequestStatus.done;
        update();
      } else {
        status = RequestStatus.error;
        customSnackBar(title: response.data["message"]??"Error");
        update();
      }
  }
  File? imageFile;
  String? img64;
  String? photoView;
  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      imageFile = imageTemporary;
      update();
      final bytes = File(image.path).readAsBytesSync();
      img64 = base64Encode(bytes);
      setAvatar(image: img64!);
      // bytes2 = const Base64Decoder().convert(img64!);
    } on PlatformException catch (e) {
      debugPrint("field picked image $e");
    }
  }
}

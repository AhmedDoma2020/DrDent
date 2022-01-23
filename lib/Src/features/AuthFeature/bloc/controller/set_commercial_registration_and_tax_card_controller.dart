import 'dart:convert';
import 'dart:io';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/start_now_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/set_commercial_registration_and_tax_card_repo.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/wating_screen.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SetCommercialRegistrationAndTaxCardController extends GetxController {
  TextEditingController? numOfCommercialRegistrationController;
  TextEditingController? numOfTaxRegistrationController;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final SetCommercialRegistrationAndTaxCardRepository
      _setCommercialRegistrationAndTaxCardRepository =
      SetCommercialRegistrationAndTaxCardRepository();
  String? _logImg64;
  String? _taxImg64;


  String? get logImg64 => _logImg64;
  String? get taxImg64 => _taxImg64;

  set setLogImg64(String value) {
    _logImg64 = value;
    update();

  }
  set setTaxImg64(String value) {
    _taxImg64 = value;
    update();
  }

  void submit() async {
    if(globalKey.currentState!.validate()){
      if ((_logImg64 != null || _logImg64 !="" ) || (_taxImg64 != null || _taxImg64 !="")) {
        globalKey.currentState!.save();
        setLoading();
        var response = await _setCommercialRegistrationAndTaxCardRepository
            .setCommercialRegistrationAndTaxCard(
          numOfCommercialRegistration: numOfCommercialRegistrationController!.text,
          numOfTaxRegistration: numOfTaxRegistrationController!.text,
          imageOfCommercialRegistration: _logImg64!,
          imageOfTaxRegistration: _taxImg64!,
        );
        Get.back();
        update();
        if (response.statusCode == 200 && response.data["status"] == true) {
          // Get.to(() => WattingScreen());
          Get.offAll(()=> StartNowScreen());
          customSnackBar(title: response.data['message']??"");
        } else {
          customSnackBar(title: response.data['message']??"");
        }
      } else {
        customSnackBar(title: "must_upload_file".tr);
      }
    }

  }
  @override
  void onInit() {
    super.onInit();
    numOfCommercialRegistrationController = TextEditingController();
    numOfTaxRegistrationController = TextEditingController();
  }


  @override
  void dispose() {
    numOfCommercialRegistrationController?.dispose();
    numOfTaxRegistrationController?.dispose();
    super.dispose();
  }


}

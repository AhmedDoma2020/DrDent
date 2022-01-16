import 'dart:io';
import 'dart:convert';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import '../Repository/set_detection_location_details_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DetectionLocationDetailsController extends GetxController {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController? phone1Controller;
  TextEditingController? phone2Controller;
  TextEditingController? nameController;
  TextEditingController? priceExaminationController;

  final GlobalKey<FormState> globalKey2 = GlobalKey<FormState>();
  TextEditingController? addressController = TextEditingController();
  TextEditingController? cityController = TextEditingController();
  TextEditingController? stateController = TextEditingController();
  TextEditingController? buildNumController = TextEditingController();
  TextEditingController? flatNumController = TextEditingController();
  TextEditingController? spMarkController = TextEditingController();

  double? _lat;

  double? get lat => _lat;

  set setLat(double value) {
    _lat = value;
  }

  double? _lon;

  double? get lon => _lon;

  set setLon(double value) {
    _lon = value;
  }

  int? _stateId;

  int? get stateId => _stateId;

  set setStateId(int value) {
    _stateId = value;
  }

  int? _cityId;
  int? get cityId => _cityId;
  set setCityId(int value) {
    _cityId = value;
  }

  String? _img64;
  String? get img64 => _img64;
  set setImg64(String value) {
    _img64 = value;
  }

  final DetectionLocationDetailsRepository _detectionLocationDetailsRepository =
      DetectionLocationDetailsRepository();

  void submitEnd() async {
    if (globalKey.currentState!.validate()) {
      if(_img64 !=null && _img64 !=''){
        globalKey.currentState!.save();
        setLoading();
        var response = await _detectionLocationDetailsRepository.detectionLocationDetails(
          name: nameController!.text,
          phone1: phone1Controller!.text,
          phone2: phone2Controller!.text,
          price: priceExaminationController!.text,
          address: addressController!.text,
          lat: _lat!,
          lon: _lon!,
          stateId: _stateId!,
          cityId: _cityId!,
          buildNumber: buildNumController!.text,
          flatNumber: flatNumController!.text,
          mark: spMarkController!.text,
          image: _img64!,
        );
        Get.back();
        customSnackBar(title: response.data["message"]);
      }else{
        customSnackBar(title: "must_set_photo_of_clinic_or_center".tr);
      }
    }else{
      customSnackBar(title: "Error_");
    }
  }

  @override
  void onInit() {
    super.onInit();
    phone1Controller = TextEditingController();
    phone2Controller = TextEditingController();
    nameController = TextEditingController();
    priceExaminationController = TextEditingController();
    addressController = TextEditingController();

    cityController = TextEditingController();
    buildNumController = TextEditingController();
    flatNumController = TextEditingController();
    spMarkController = TextEditingController();
    stateController = TextEditingController();
  }

  @override
  void dispose() {
    phone1Controller?.dispose();
    phone2Controller?.dispose();
    nameController?.dispose();
    priceExaminationController?.dispose();
    addressController?.dispose();

    cityController?.dispose();
    buildNumController?.dispose();
    flatNumController?.dispose();
    spMarkController?.dispose();
    stateController?.dispose();
    super.dispose();
  }


}

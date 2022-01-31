import 'dart:io';
import 'dart:convert';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/MyGeneralDataFeature/Ui/Screen/enter_personal_data_of_graduated.dart';
import '../../../../GlobalInfoemationFeature/MyGeneralDataFeature/Ui/Screen/enter_personal_data_of_doctor_screen.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/screens/work_time_screen.dart';
import 'package:get_storage/get_storage.dart';
import '../Repository/set_detection_location_details_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'featch_detection_location_details_controller.dart';

class SetDetectionLocationDetailsController extends GetxController {
  final bool isAuth;

  SetDetectionLocationDetailsController({this.isAuth = false});

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
  GetStorage box = GetStorage();

  final DetectionLocationDetailsRepository _detectionLocationDetailsRepository =
      DetectionLocationDetailsRepository();
  final FetchDetectionLocationDetailsController
      _fetchDetectionLocationDetailsController =
      FetchDetectionLocationDetailsController();

  void submitEnd() async {
    if (globalKey.currentState!.validate()) {
      if (_img64 != null && _img64 != '') {
        globalKey.currentState!.save();
        setLoading();
        var response =
            await _detectionLocationDetailsRepository.detectionLocationDetails(
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
        if (response.statusCode == 200 && response.data["status"] == true) {

          box.write('workspace_id', response.data['data']['id']??0);
          if (isAuth == true) {
            debugPrint("in uth");
            if(box.read('user_type_id') ==3 ){
              Get.offAll(() => WorkTimeScreen(
                doctorId: box.read('id'),
                onSuccess: () {
                    Get.to(() => EnterPersonalDataOfDoctorScreen());
                },
                workspaceId: box.read('workspace_id'),
              ));
            }else if(box.read('user_type_id') == 4){
              Get.offAll(() => WorkTimeScreen(
                onSuccess: () {
                  Get.to(() => EnterPersonalDataOfGraduatedScreen());
                },
                workspaceId: box.read('workspace_id'),
              ));
            }



            // Get.to(() => EnterDoctorPersonalDataScreen());
          } else {
            debugPrint("not uth");
            // Get.to(() => DetectionLocationDetailsScreen());
            _fetchDetectionLocationDetailsController
                .fetchMyDetectionLocationDetails();
            Get.back();
            update();
          }
          customSnackBar(title: response.data["message"]);
          update();
        } else {
          customSnackBar(title: response.data["message"]);
          update();
        }
      } else {
        customSnackBar(title: "must_set_photo_of_clinic_or_center".tr);
      }
    } else {
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

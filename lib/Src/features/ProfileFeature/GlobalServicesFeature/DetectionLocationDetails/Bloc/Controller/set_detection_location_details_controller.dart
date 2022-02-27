import 'dart:io';
import 'dart:convert';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/MyGeneralDataFeature/Ui/Screen/enter_personal_data_of_graduated.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Ui/View/add_center_doctor_screen.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/controller/work_time_controller.dart';
import '../../../../../../bloc/model/detection_location_details_model.dart';
import '../../../../GlobalInfoemationFeature/MyGeneralDataFeature/Ui/Screen/enter_personal_data_of_doctor_screen.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/screens/work_time_screen.dart';
import 'package:get_storage/get_storage.dart';
import '../Repository/edit_work_space_details_repo.dart';
import '../Repository/set_work_space_details_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'featch_detection_location_details_controller.dart';

class SetWorkSpaceDetailsDetailsController extends GetxController {
  final bool isAuth;
  final bool isEdit;
  final WorkSpaceDetailsModel? workSpace;

  SetWorkSpaceDetailsDetailsController({
    this.isAuth = false,
    this.isEdit = false,
    this.workSpace,
  });

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

  String _img64 = '';

  String get img64 => _img64;

  set setImg64(String value) {
    _img64 = value;
  }

  String _futureImage = '';

  String get futureImage => _futureImage;

  void setDataToEdit() {
    debugPrint("workSpace model in setDataToEdit $workSpace");
    nameController!.text = workSpace!.name;
    phone1Controller!.text = workSpace!.phone;
    phone2Controller!.text = workSpace!.phone2;
    priceExaminationController!.text = workSpace!.price;
    addressController!.text = workSpace!.address.address;
    setLat = workSpace!.address.lat;
    setLon = workSpace!.address.lon;
    setStateId = workSpace!.address.stateId;
    stateController!.text = workSpace!.address.state;
    cityController!.text = workSpace!.address.city;
    setCityId = workSpace!.address.cityId;
    buildNumController!.text = workSpace!.address.bulidingNumber;
    flatNumController!.text = workSpace!.address.flatNumber;
    spMarkController!.text = workSpace!.address.mark;
    _futureImage = workSpace!.image;
    update();
  }

  GetStorage box = GetStorage();
  final FetchWorkSpaceDetailsController _fetchWorkSpaceDetailsController =
      Get.put(FetchWorkSpaceDetailsController());
  final SetWorkSpaceDetailsRepository _setWorkSpaceDetailsRepository =
      SetWorkSpaceDetailsRepository();
  void setWorkSpace() async {
    if (globalKey.currentState!.validate()) {
      if (_img64 != null && _img64 != '' || _futureImage != "") {
        globalKey.currentState!.save();
        setLoading();
        var response = await _setWorkSpaceDetailsRepository.setWorkSpaceDetails(
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
          image: _img64,
        );
        Get.back();
        if (response.statusCode == 200 && response.data["status"] == true) {
          int _workspaceId = response.data['data']['id'] ?? 0;
          debugPrint("_workspaceId $_workspaceId");
          debugPrint("doctor id is ${box.read('id')}");
          if (isAuth == true) {
            debugPrint("in uth");
            if (box.read('user_type_id') == 3) {
              Get.offAll(() => WorkTimeScreen(
                    userType: UserTypeEnum.doctor,
                    doctorId: box.read('id'),
                    onSuccess: () {
                      Get.to(() => EnterPersonalDataOfDoctorScreen(
                            isEdit: false,
                          ));
                    },
                    workspaceId: _workspaceId,
                  ));
            } else if (box.read('user_type_id') == 4) {
              Get.offAll(() => WorkTimeScreen(
                    userType: UserTypeEnum.center,
                    onSuccess: () {
                      Get.offAll(() => AddCenterDoctorScreen(
                            isAuth: true,
                          ));
                    },
                    workspaceId: _workspaceId,
                  ));
            }
          } else {
            debugPrint("not uth");
            if (box.read('user_type_id') == 3) {
              Get.back();
              Get.to(() => WorkTimeScreen(
                    userType: UserTypeEnum.doctor,
                    doctorId: box.read('id'),
                    onSuccess: () {
                      Get.back();
                    },
                    workspaceId: _workspaceId,
                  ));
            } else if (box.read('user_type_id') == 4) {
              debugPrint("aaaaaaaaaa1");
              Get.back();
              Get.to(() => WorkTimeScreen(
                    userType: UserTypeEnum.center,
                    onSuccess: () {
                      debugPrint("aaaaaaaaaa");
                      Get.back();
                    },
                    workspaceId: _workspaceId,
                  ));
            }
            _fetchWorkSpaceDetailsController.fetchMyWorkSpaceDetails();
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

  final EditWorkSpaceDetailsRepository _editWorkSpaceDetailsRepository =
      EditWorkSpaceDetailsRepository();

  void editWorkSpace({required int workSpaceId}) async {
    if (globalKey.currentState!.validate()) {
      if (_img64 != '' || _futureImage != "") {
        globalKey.currentState!.save();
        setLoading();
        var response =
        await _editWorkSpaceDetailsRepository.editWorkSpaceDetails(
          workSpaceId: workSpaceId,
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
          image: _img64,
        );
        Get.back();
        if (response.statusCode == 200 && response.data["status"] == true) {
          Get.back();
          customSnackBar(title: response.data["message"]);
          _fetchWorkSpaceDetailsController.fetchMyWorkSpaceDetails();
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
    if(isEdit)setDataToEdit();
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

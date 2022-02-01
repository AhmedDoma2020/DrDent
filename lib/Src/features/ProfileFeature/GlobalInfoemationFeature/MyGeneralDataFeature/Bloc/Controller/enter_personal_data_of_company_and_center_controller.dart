import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/MyGeneralDataFeature/Bloc/Repo/enter_and_edit_personal_data_of_company_and_center_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_profile_controller.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EnterPersonalDataOfCompanyAndCenterController extends GetxController {
  final bool isEdit;

  EnterPersonalDataOfCompanyAndCenterController({this.isEdit = false});

  GetStorage box = GetStorage();
  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? administratorPhoneController;
  TextEditingController? administratorNameController;
  TextEditingController? taxNumberController;
  TextEditingController? logRecordController;
  TextEditingController? addressController;
  TextEditingController? aboutController;

  String _avatar = "";
  String get avatar => _avatar;
  set setAvatar(String value) {
    _avatar = value;
  }

  String _taxNumberImage = '';
  String get taxNumberImage => _taxNumberImage;
  set setTaxNumberImage(String value) {
    _taxNumberImage = value;
  }

  String _logRecordImage = '';

  String get logRecordImage => _logRecordImage;

  set setLogRecordImage(String value) {
    _logRecordImage = value;
  }

  int? _universityId;

  int? get universityId => _universityId;

  set setUniversityId(int value) {
    _universityId = value;
  }

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

  void setData() {
    debugPrint("ddddddone 1");
    final FetchProfileController _fetchProfileDoctorController =
        Get.put(FetchProfileController());
    debugPrint("ddddddone 2");
    if (isEdit == true) {
      debugPrint("ddddddone 3");
      nameController!.text = _fetchProfileDoctorController.name!;
      phoneController!.text = _fetchProfileDoctorController.degreeTitle!;
      debugPrint("nameController!.text ${nameController!.text}");
      debugPrint("degreeController!.text ${phoneController!.text}");
      update();
    }
  }

  RequestStatus status = RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final EnterAndEditPersonalDataOfCompanyAndCenterRepository
      _enterAndEditPersonalDataOfCompanyAndCenterRepository =
      EnterAndEditPersonalDataOfCompanyAndCenterRepository();

  void submit() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      if (_avatar != "") {
        if (_taxNumberImage != "") {
          if (_logRecordImage != "") {
            setLoading();
            var response =
                await _enterAndEditPersonalDataOfCompanyAndCenterRepository
                    .enterAndEditPersonalDataOfCompanyAndCenter(
              avatar: _avatar,
              name: nameController!.text,
              administratorPhone: administratorPhoneController!.text,
              administratorName: administratorNameController!.text,
              // stateId: stateId!,
              // cityId: cityId!,
              // lat: lat!,
              // lon: lon!,
              // address: addressController!.text,
              taxNumber: taxNumberController!.text,
              logRecord: logRecordController!.text,
              taxNumberImage: taxNumberImage,
              logRecordImage: logRecordImage,
              moreInfo: aboutController!.text,
            );
            Get.back();
            if (response.statusCode == 200 && response.data["status"] == true) {
              debugPrint("request operation success");
              customSnackBar(title: response.data["message"]);
              debugPrint("convert operation success");
              status = RequestStatus.done;
              update();
            } else {
              status = RequestStatus.error;
              customSnackBar(title: response.data["message"]);
              update();
            }
          } else {
            customSnackBar(title: "must_set_commercial_registration_image".tr);
          }
        } else {
          customSnackBar(title: "must_set_tax_record_image".tr);
        }
      } else {
        customSnackBar(title: "must_set_avatar".tr);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    administratorPhoneController = TextEditingController();
    administratorNameController = TextEditingController();
    taxNumberController = TextEditingController();
    logRecordController = TextEditingController();
    addressController = TextEditingController();
    aboutController = TextEditingController();
    // setData();
  }

  @override
  void dispose() {
    nameController?.dispose();
    phoneController?.dispose();
    administratorPhoneController?.dispose();
    administratorNameController?.dispose();
    taxNumberController?.dispose();
    logRecordController?.dispose();
    addressController?.dispose();
    aboutController?.dispose();
    super.dispose();
  }
}

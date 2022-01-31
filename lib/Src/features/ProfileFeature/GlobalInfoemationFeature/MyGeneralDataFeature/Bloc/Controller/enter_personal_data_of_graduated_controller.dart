import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/BaseFeature/ui/screens/base_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/MyGeneralDataFeature/Bloc/Repo/enter_and_edit_personal_data_of_graduated_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_profile_controller.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Repo/enter_and_edit_personal_data_of_doctor_repo.dart';

class EnterPersonalDataOfGraduatedController extends GetxController {
  final bool isEdit;

  EnterPersonalDataOfGraduatedController({this.isEdit = false});

  GetStorage box = GetStorage();
  TextEditingController? nameController;
  TextEditingController? degreeController;
  TextEditingController? specializationController;
  TextEditingController? addInfoController;
  TextEditingController? universityController;
  TextEditingController? graduationYearController;
  TextEditingController? universityDegreeController;
  List<int> _specializationIdSelected = [];

  List<int> get specializationIdSelected => _specializationIdSelected;

  set setSpecializationIdSelected(List<int> value) {
    _specializationIdSelected = value;
  }

  String _gender = "male";

  String get gender => _gender;

  set estGender(String value) {
    _gender = value;
  }

  String _avatar = "";

  String get avatar => _avatar;

  set setAvatar(String value) {
    _avatar = value;
  }

  int? _universityId;
  int? get universityId => _universityId;
  set setUniversityId(int value) {
    _universityId = value;
  }

  String _graduationCertificateImage = '';
  String get graduationCertificateImage => _graduationCertificateImage;
  set setGraduationCertificateImage(String value) {
    _graduationCertificateImage = value;
  }

  String _cVImage = '';
  String get cVImage => _cVImage;
  set setCVImage(String value) {
    _cVImage = value;
  }

  void setData() {
    debugPrint("ddddddone 1");
    final FetchProfileController _fetchProfileDoctorController =
        Get.put(FetchProfileController());
    debugPrint("ddddddone 2");
    if (isEdit == true) {
      debugPrint("ddddddone 3");
      nameController!.text = _fetchProfileDoctorController.name!;
      degreeController!.text = _fetchProfileDoctorController.degree!;
      debugPrint("nameController!.text ${nameController!.text}");
      debugPrint("degreeController!.text ${degreeController!.text}");
      update();
    }
  }

  RequestStatus status = RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final EnterAndEditPersonalDataOfGraduatedRepository
      _enterAndEditPersonalDataOfGraduatedRepository =
      EnterAndEditPersonalDataOfGraduatedRepository();

  void submit() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      if (_avatar != "") {
        if(_graduationCertificateImage != ""){
          if(_cVImage != ""){
            setLoading();
            var response = await _enterAndEditPersonalDataOfGraduatedRepository
                .enterAndEditPersonalDataOfGraduated(
              avatar: avatar,
              name: nameController!.text,
              gender: gender,
              universityId: universityId!,
              graduationYear: graduationYearController!.text,
              graduationDegree: degreeController!.text,
              specializationId: specializationIdSelected,
              graduationCertificate: graduationCertificateImage,
              cv: cVImage,
            );
            Get.back();
            if (response.statusCode == 200 && response.data["status"] == true) {
              debugPrint("request operation success");
              customSnackBar(title: response.data["message"]);
              Get.offAll(() => BaseScreen());
              debugPrint("convert operation success");
              status = RequestStatus.done;
              update();
            } else {
              status = RequestStatus.error;
              customSnackBar(title: response.data["message"]);
              update();
            }
          }else{
            customSnackBar(title: "must_set_photo_of_Work_licenses".tr);
          }
        }else{
          customSnackBar(title: "must_set_photo_of_Work_licenses".tr);
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
    degreeController = TextEditingController();
    specializationController = TextEditingController();
    addInfoController = TextEditingController();
    universityController = TextEditingController();
    graduationYearController = TextEditingController();
    universityDegreeController = TextEditingController();
    _specializationIdSelected = [];
    // setData();
  }

  @override
  void dispose() {
    nameController?.dispose();
    degreeController?.dispose();
    specializationController?.dispose();
    addInfoController?.dispose();
    universityController?.dispose();
    graduationYearController?.dispose();
    universityDegreeController?.dispose();
    super.dispose();
  }
}

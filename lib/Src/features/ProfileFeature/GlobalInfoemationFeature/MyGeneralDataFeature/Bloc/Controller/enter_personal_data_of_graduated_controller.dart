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

  int _universityId =0;
  int get universityId => _universityId;
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
  String _futureAvatar   ='';
  String get futureAvatar => _futureAvatar;
  String _futureCertification   ='';
  String get futureCertification => _futureCertification;
String _futureCv='';

  String get futureCv => _futureCv;

  void setData() {
    if (isEdit == true) {
      debugPrint("ddddddone 3");
      final FetchProfileController _fetchProfileDoctorController = Get.find();
      // nameController!.text = _fetchProfileDoctorController.name!;
      universityController!.text = _fetchProfileDoctorController.universityTitle;
      _universityId = _fetchProfileDoctorController.universityId;
      graduationYearController!.text = _fetchProfileDoctorController.graduationYear;
      universityDegreeController!.text =_fetchProfileDoctorController.graduationDegree;
      debugPrint("_fetchProfileDoctorController.specialization1");
      debugPrint("_fetchProfileDoctorController.specialization2 ${_fetchProfileDoctorController.specialization}");
      specializationController!.text = _fetchProfileDoctorController.specialization;
      _specializationIdSelected = _fetchProfileDoctorController.specializationIds;
      _futureAvatar = _fetchProfileDoctorController.avatar!;
      degreeController!.text = _fetchProfileDoctorController.degreeTitle;
      _universityId = _fetchProfileDoctorController.universityId;
      _futureCertification = _fetchProfileDoctorController.photoOfWorkLicenses;
      debugPrint(" _fetchProfileDoctorController.cv ${ _fetchProfileDoctorController.cv}");

      _futureCv = _fetchProfileDoctorController.cv;
      update();
    }
  }

  RequestStatus status = RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final EnterAndEditPersonalDataOfGraduatedRepository _enterAndEditPersonalDataOfGraduatedRepository = EnterAndEditPersonalDataOfGraduatedRepository();

  void submit() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      if (_avatar != "" || _futureAvatar != '') {
        if(_graduationCertificateImage != "" || _futureCertification != ""){
          if(_cVImage != ""|| _futureCv != ''){
            setLoading();
            var response = await _enterAndEditPersonalDataOfGraduatedRepository
                .enterAndEditPersonalDataOfGraduated(
              avatar: _avatar,
              name: nameController!.text,
              gender: _gender,
              universityId: _universityId,
              graduationYear: graduationYearController!.text,
              graduationDegree: universityDegreeController!.text,
              specializationId: _specializationIdSelected,
              graduationCertificate: _graduationCertificateImage,
              cv: cVImage,
            );
            Get.back();
            if (response.statusCode == 200 && response.data["status"] == true) {
              debugPrint("request operation success");
              if(isEdit){
                final FetchProfileController _fetchProfileDoctorController = Get.find();
                _fetchProfileDoctorController.fetchProfileDoctor();
                Get.back();
              }else{
                Get.offAll(() => BaseScreen());
              }
              customSnackBar(title: response.data["message"]??"");
              debugPrint("convert operation success");
              status = RequestStatus.done;
              update();
            } else {
              status = RequestStatus.error;
              customSnackBar(title: response.data["message"]);
              update();
            }
          }else{
            customSnackBar(title: "must_attach_your_CV".tr);
          }
        }else{
          customSnackBar(title: "must_set_graduation_certificate_image".tr);
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
    nameController!.text = box.read('name');
    degreeController = TextEditingController();
    specializationController = TextEditingController();
    addInfoController = TextEditingController();
    universityController = TextEditingController();
    graduationYearController = TextEditingController();
    universityDegreeController = TextEditingController();
    _specializationIdSelected = [];
    if(isEdit){
      setData();
    }else{
      _futureAvatar = box.read('image');
      _futureCertification = box.read('work_lisence');
    }
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

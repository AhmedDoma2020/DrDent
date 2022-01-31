import 'package:dr_dent/Src/core/utils/request_status.dart';
import '../../../ProfileFeature/GlobalInfoemationFeature/MyGeneralDataFeature/Bloc/Repo/enter_and_edit_personal_data_of_doctor_repo.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/Repository/add_a_jop_offer_repo.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/Repository/enter_your_information_to_apply_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EnterYourInformationToApplyJobController extends GetxController {
  GetStorage box = GetStorage();
  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? emailController;
  TextEditingController? universityController;
  TextEditingController? graduationYearController;
  TextEditingController? universityDegreeController;
  TextEditingController? specializationController;
  List<int> _specializationIdSelected = [];
  List<int> get specializationIdSelected => _specializationIdSelected;
  set setSpecializationIdSelected(List<int> value) {
    _specializationIdSelected = value;
  }

  int? _servicesId;
  int? get servicesId => _servicesId;
  set setServicesId(int value) {
    _servicesId = value;
  }

  String _gender ="";
  String get gender => _gender;
  set setGender(String value) {
    _gender = value;
  }

  String _graduationCertificateImage='';
  String get graduationCertificateImage => _graduationCertificateImage;
  set setGraduationCertificateImage(String value) {
    _graduationCertificateImage = value;
  }

  String _cVImage='';
  String get cVImage => _cVImage;
  set setCVImage(String value) {
    _cVImage = value;
  }


  RequestStatus status = RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final EnterYourInformationToApplyRepository _enterYourInformationToApplyRepository =
  EnterYourInformationToApplyRepository();
  void submit() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      if(_graduationCertificateImage !=""){
        if(_cVImage!= ""){
          customSnackBar(title: "Done",);
// setLoadingDialog();
//       var response = await _enterYourInformationToApplyRepository.enterYourInformationToApply(
//         name: nameController!.text,
//         phone: phoneController!.text,
//         email: emailController!.text,
//         university: universityController!.text,
//         specializationId: _specializationIdSelected,
//         graduationYear: graduationYearController!.text,
//         universityDegree: universityDegreeController!.text,
//         gender: _gender,
//         graduationCertificateImage: _graduationCertificateImage,
//         cVImage: _cVImage,
//       );

          // if (response.statusCode == 200 && response.data["status"] == true) {
          //   debugPrint("request operation success");
          //
          //   debugPrint("convert operation success");
          //   status = RequestStatus.done;
          //   update();
          // } else {
          //   status = RequestStatus.error;
          //   update();
          // }
        }else{
          customSnackBar(title: "must_attach_your_CV".tr,);
        }
      }else{
        customSnackBar(title: "must_enter_graduation_certificate_image".tr,);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    universityController = TextEditingController();
    graduationYearController = TextEditingController();
    universityDegreeController = TextEditingController();
    specializationController = TextEditingController();
    _specializationIdSelected = [];
  }

  @override
  void dispose() {
    nameController?.dispose();
    phoneController?.dispose();
    emailController?.dispose();
    universityController?.dispose();
    graduationYearController?.dispose();
    universityDegreeController?.dispose();
    specializationController?.dispose();
    super.dispose();
  }


}

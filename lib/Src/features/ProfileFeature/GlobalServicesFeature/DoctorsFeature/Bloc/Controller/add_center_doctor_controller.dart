import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/enter_and_edit_my_personal_data_repo.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/Repository/add_a_jop_offer_repo.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/Repository/enter_your_information_to_apply_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Bloc/Repository/add_center_doctor_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddCenterDoctorController extends GetxController {
  GetStorage box = GetStorage();
  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? jobTitleController;
  TextEditingController? jobTitleAndSpecializationController;
  TextEditingController? noteController;
  int _specializationIdSelected =0;
  int get specializationIdSelected => _specializationIdSelected;
  set setSpecializationIdSelected(int value) {
    _specializationIdSelected = value;
  }
  String _gender ="";
  String get gender => _gender;
  set setGender(String value) {
    _gender = value;
  }

  String _avatar='';
  String get avatar => _avatar;
  set setAvatar(String value) {
    _avatar = value;
  }


  RequestStatus status = RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final AddCenterDoctorRepository _addCenterDoctorRepository =
  AddCenterDoctorRepository();
  void submit() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
        if(_avatar!= ""){
          customSnackBar(title: "Done",);
       // setLoadingDialog();
      var response = await _addCenterDoctorRepository.addCenterDoctor(
        name: nameController!.text,
        phone: phoneController!.text,
        specializationId:_specializationIdSelected,
        gender: _gender,
        notes: noteController!.text,
        avatar: _avatar,
        jobTitle: jobTitleController!.text,
      );

          if (response.statusCode == 200 && response.data["status"] == true) {
            print("request operation success");

            print("convert operation success");
            status = RequestStatus.done;
            update();
          } else {
            status = RequestStatus.error;
            update();
          }
        }else{
          customSnackBar(title: "must_attach_your_avatar".tr,);
        }
    }
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    jobTitleController = TextEditingController();
    jobTitleAndSpecializationController = TextEditingController();
    noteController = TextEditingController();
  }

  @override
  void dispose() {
    nameController?.dispose();
    phoneController?.dispose();
    jobTitleController?.dispose();
    jobTitleAndSpecializationController?.dispose();
    noteController?.dispose();
    super.dispose();
  }


}

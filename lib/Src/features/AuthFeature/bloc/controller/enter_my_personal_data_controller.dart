import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/enter_and_edit_my_personal_data_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EnterMyPersonalDataController extends GetxController {
  GetStorage box = GetStorage();
  TextEditingController? nameController;
  TextEditingController? degreeController;
  TextEditingController? specializationController;
  TextEditingController? addInfoController;
  List<int> _specializationIdSelected=[];
  List<int> get specializationIdSelected => _specializationIdSelected;

  set setSpecializationIdSelected(List<int> value) {
    _specializationIdSelected = value;
  }

  int _gender = 0;
  int get gender => _gender;

  set estGender(int value) {
    _gender = value;
  }

  set setSexType(int value) {
    _gender = value;
  }
  String _image = "";
  String get image => _image;
  set setImage(String value) {
    _image = value;
  }
  int? _servicesId;
  int? get servicesId => _servicesId;
  set setServicesId(int value) {
    _servicesId = value;
  }
  RequestStatus status = RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final EnterAndEditMyPersonalDataRepository _enterAndEditMyPersonalDataRepository = EnterAndEditMyPersonalDataRepository();
  void submit() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      if(_image != ""){
// setLoadingDialog();
        print(" nameController!.text ${ nameController!.text}");
        print(" _gender $_gender");
        print(" degreeController!.text ${degreeController!.text}");
        print(" _specializationIdSelected $_specializationIdSelected");
        print(" addInfoController!.text ${addInfoController!.text}");
        print(" image $image");
        // var response = await  _enterAndEditMyPersonalDataRepository.enterAndEditMyPersonalData(
        //   name: nameController!.text,
        //   gender: _gender,
        //   scientificLevel: degreeController!.text,
        //  specializationId: _specializationIdSelected,
        //   moreInfo: addInfoController!.text,
        //   image: image,
        // );
        //  if (response.statusCode == 200 && response.data["status"] == true) {
        //    print("request operation success");
        //
        //    print("convert operation success");
        //    status = RequestStatus.done;
        //    update();
        //  } else {
        //    status = RequestStatus.error;
        //    update();
        //  }
      }else{
        customSnackBar(title: "must_set_photo_of_Work_licenses".tr);
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
    _specializationIdSelected =[];
  }

  @override
  void dispose() {
    nameController?.dispose();
    degreeController?.dispose();
    specializationController?.dispose();
    addInfoController?.dispose();
    super.dispose();
  }
}

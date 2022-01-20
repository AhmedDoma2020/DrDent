import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/enter_and_edit_my_personal_data_repo.dart';
import 'package:dr_dent/Src/features/BaseFeature/ui/screens/base_screen.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_profile_controller.dart';


class EnterMyPersonalDataController extends GetxController {
  final bool isEdit;
  EnterMyPersonalDataController({ this.isEdit =false});

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
  String _gender = "male";
  String get gender => _gender;
  set estGender(String value) {
    _gender = value;
  }
  String _image = "";
  String get image => _image;
  set setImage(String value) {
    _image = value;
  }
  int? _scientificId;
  int? get scientificId => _scientificId;
  set setScientificId(int value) {
    _scientificId = value;
  }

  void setData(){
    debugPrint("ddddddone 1");
    final FetchProfileController _fetchProfileDoctorController = Get.put(FetchProfileController());
    debugPrint("ddddddone 2");
    if(isEdit ==true){
      debugPrint("ddddddone 3");
      nameController!.text= _fetchProfileDoctorController.name!;
      degreeController!.text= _fetchProfileDoctorController.degree!;
      debugPrint("nameController!.text ${nameController!.text}");
      debugPrint("degreeController!.text ${degreeController!.text}");
      update();
    }
  }

  RequestStatus status = RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final EnterAndEditMyPersonalDataRepository _enterAndEditMyPersonalDataRepository = EnterAndEditMyPersonalDataRepository();
  void submit() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      if(_image != ""){
        setLoading();
        debugPrint(" nameController!.text ${ nameController!.text}");
        debugPrint(" _gender $_gender");
        debugPrint(" degreeController!.text $scientificId");
        debugPrint(" _specializationIdSelected $_specializationIdSelected");
        debugPrint(" addInfoController!.text ${addInfoController!.text}");
        debugPrint(" image $image");
        var response = await  _enterAndEditMyPersonalDataRepository.enterAndEditMyPersonalData(
          name: nameController!.text,
          gender: _gender,
          scientificLevel: scientificId!,
         specializationId: _specializationIdSelected,
          moreInfo: addInfoController!.text,
          image: image,
        );
        Get.back();
         if (response.statusCode == 200 && response.data["status"] == true) {
           debugPrint("request operation success");
           customSnackBar(title: response.data["message"]);
           Get.offAll(()=>BaseScreen());
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
    // setData();
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

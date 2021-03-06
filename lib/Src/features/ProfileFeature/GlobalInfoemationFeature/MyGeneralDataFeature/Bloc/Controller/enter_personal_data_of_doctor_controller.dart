import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import '../Repo/enter_and_edit_personal_data_of_doctor_repo.dart';
import 'package:dr_dent/Src/features/BaseFeature/ui/screens/base_screen.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_profile_controller.dart';


class EnterPersonalDataOfDoctorController extends GetxController {
  final bool isEdit;
  EnterPersonalDataOfDoctorController({ this.isEdit =false});
  GetStorage box = GetStorage();
  TextEditingController? nameController;
  TextEditingController? degreeController;
  TextEditingController? specializationController;
  TextEditingController? addInfoController;
  TextEditingController? yearOfExperienceController;
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

  int _scientificId = 0;
  int get scientificId => _scientificId;
  set setScientificId(int value) {
    _scientificId = value;
  }

  String _imageFuture   ='';
  String get imageFuture => _imageFuture;

  void setData(){
    debugPrint("ddddddone 1");
    debugPrint("ddddddone 2");
    if(isEdit ==true){
      debugPrint("ddddddone 3");
      final FetchProfileController _fetchProfileDoctorController = Get.put(FetchProfileController());
      nameController!.text= _fetchProfileDoctorController.name!;
      degreeController!.text= _fetchProfileDoctorController.degreeTitle;
      specializationController!.text = _fetchProfileDoctorController.specialization;
      _scientificId = _fetchProfileDoctorController.degreeId;
      _specializationIdSelected = _fetchProfileDoctorController.specializationIds;
      _imageFuture = _fetchProfileDoctorController.photoOfWorkLicenses;
      addInfoController!.text = _fetchProfileDoctorController.about;
      yearOfExperienceController!.text = _fetchProfileDoctorController.yearOfGraduation;
      _gender = _fetchProfileDoctorController.gender!;
      // _image = _fetchProfileDoctorController.
      debugPrint("nameController!.text ${nameController!.text}");
      debugPrint("degreeController!.text ${degreeController!.text}");
      update();
    }
  }

  RequestStatus status = RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final EnterAndEditPersonalDataOfDoctorRepository _enterAndEditMyPersonalDataRepository = EnterAndEditPersonalDataOfDoctorRepository();
  void submit() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      if(image != "" || _imageFuture != ''){
        setLoading();
        debugPrint(" nameController!.text ${ nameController!.text}");
        debugPrint(" _gender $_gender");
        debugPrint(" degreeController!.text $scientificId");
        debugPrint(" _specializationIdSelected $_specializationIdSelected");
        debugPrint(" addInfoController!.text ${addInfoController!.text}");
        debugPrint(" image $image");
        var response = await  _enterAndEditMyPersonalDataRepository.enterAndEditPersonalDataOfDoctor(
          name: nameController!.text,
          gender: _gender,
          scientificLevel: scientificId,
         specializationId: _specializationIdSelected,
          moreInfo: addInfoController!.text,
          image: image,
          yearOfExperience: yearOfExperienceController!.text,
        );
        Get.back();
         if (response.statusCode == 200 && response.data["status"] == true) {
           final FetchProfileController _fetchProfileDoctorController = Get.put(FetchProfileController());
           debugPrint("request operation success");
           if(isEdit){
             _fetchProfileDoctorController.fetchProfileDoctor();
             Get.back();
           }else{
             Get.offAll(()=>BaseScreen());
           }
           customSnackBar(title: response.data["message"]);

           // Get.offAll(()=>BaseScreen());
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
    nameController!.text = box.read('name')??"";
    degreeController = TextEditingController();
    specializationController = TextEditingController();
    addInfoController = TextEditingController();
    yearOfExperienceController = TextEditingController();
    _specializationIdSelected =[];
    debugPrint("isEdit in onInit is$isEdit");
    debugPrint("work_lisence in onInit is ${box.read('work_lisence')}");
    if (isEdit){
      setData();
    }else{
      debugPrint("hmada");
      _imageFuture = box.read('work_lisence');
    }
  }

  @override
  void dispose() {
    nameController?.dispose();
    degreeController?.dispose();
    specializationController?.dispose();
    addInfoController?.dispose();
    yearOfExperienceController?.dispose();
    super.dispose();
  }
}

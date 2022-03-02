import 'package:dr_dent/Src/bloc/model/doctor.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/BaseFeature/ui/screens/base_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Bloc/Repository/add_center_doctor_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../../bloc/model/center_doctor_model.dart';
import '../Repository/search_doctors_repo.dart';
import 'fetch_center_doctor_controller.dart';

class AddCenterDoctorController extends GetxController {
  final bool isAuth;
  final bool isEdit;
  final CenterDoctorModel? centerDoctorModel;



  List<Doctor> doctors=[];


  AddCenterDoctorController({this.isAuth =false,this.isEdit =false,this.centerDoctorModel});

  GetStorage box = GetStorage();
  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? jobTitleController;
  TextEditingController? jobTitleAndSpecializationController;
  TextEditingController? noteController;
  List<int> _specializationIdSelected=[];
  List<int> get specializationIdSelected => _specializationIdSelected;
  set setSpecializationIdSelected(List<int> value) {
    _specializationIdSelected = value;
  }

  List<String> _specializationTitleSelected=[];
  List<String> get specializationTitleSelected => _specializationTitleSelected;
  set setSpecializationTitleSelected(List<String> value) {
    _specializationTitleSelected = value;
  }

  String _gender = "male";

  String get gender => _gender;
  set setGender(String value) {
    _gender = value;
  }

  String _avatar = '';
  String get avatar => _avatar;
  set setAvatar(String value) {
    _avatar = value;
  }
  String _futureAvatar = '';
  String get futureAvatar => _futureAvatar;
  set setFutureAvatar(String value) {
    _futureAvatar = value;
  }

  int _jopTitleId = 0;
  int get jopTitleId => _jopTitleId;
  set setJopTitleId(int value) {
    _jopTitleId = value;
  }

  void setData(){
    setFutureAvatar = centerDoctorModel!.image;
    nameController!.text= centerDoctorModel!.name;
    setGender = centerDoctorModel!.gender;
    phoneController!.text =centerDoctorModel!.phone;
    jobTitleController!.text = centerDoctorModel!.jobTitle;
    if(centerDoctorModel!.specialization.isNotEmpty){
      for(var item in centerDoctorModel!.specialization){
        _specializationTitleSelected.add(item.title);
        _specializationIdSelected.add(item.id);
      }
      jobTitleAndSpecializationController!.text = _specializationTitleSelected.join(",");
      setSpecializationIdSelected = _specializationIdSelected;
    }
    noteController!.text = centerDoctorModel!.doctorInfo;
    update();
  }
  RequestStatus status = RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final AddCenterDoctorRepository _addCenterDoctorRepository = AddCenterDoctorRepository();
  void submit() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      if (_avatar != "") {
        // customSnackBar(title: "Done",);
        setLoading();
        var response = await _addCenterDoctorRepository.addCenterDoctor(
          name: nameController!.text,
          phone: phoneController!.text,
          specializationIds: _specializationIdSelected,
          gender: _gender,
          notes: noteController!.text,
          avatar: _avatar,
          jobTitleId: _jopTitleId,
        );
        Get.back();
        if (response.statusCode == 200 && response.data["status"] == true) {
          debugPrint("request operation success");
          if(isAuth){
            Get.offAll(()=>BaseScreen());
          }else{
            final FetchCenterDoctorController _fetchCenterDoctorController =  Get.put(FetchCenterDoctorController(centerId: box.read('id')??0));
            _fetchCenterDoctorController.fetchCenterDoctor();
            Get.back();
          }
          customSnackBar(title: response.data['message'] ?? "");
          debugPrint("convert operation success");
          status = RequestStatus.done;
          update();
        } else {
          status = RequestStatus.error;
          customSnackBar(
            title: response.data['message'] ?? "",
          );
          update();
        }
      } else {
        customSnackBar(
          title: "must_attach_your_avatar".tr,
        );
      }
    }
  }





  // ========== START FETCH DATA  ====================
  final SearchDoctorsRepository _productsRepository = SearchDoctorsRepository();
  Future<void> searchDoctors({String doctorName=''})async{
    status = RequestStatus.loading;
    update();
    var response = await _productsRepository.searchDoctors(doctorName: doctorName);
    if (response.statusCode == 200 && response.data["status"] == true) {
      if(response.data['data']!=null){
        doctors.clear();
        for (var item in response.data['data']) {
          doctors.add(Doctor.fromJson(item));
        }
      }
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    }else{
      status = RequestStatus.error;
      update();
    }
  }
  // ================  END FETCH DATA  ====================












  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    jobTitleController = TextEditingController();
    jobTitleAndSpecializationController = TextEditingController();
    noteController = TextEditingController();
    if(isEdit)setData();
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

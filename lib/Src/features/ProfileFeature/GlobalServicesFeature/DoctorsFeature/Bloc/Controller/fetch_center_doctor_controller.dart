

import 'package:dr_dent/Src/bloc/model/assitant_model.dart';
import 'package:dr_dent/Src/bloc/model/center_doctor_model.dart';
import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/bloc/model/service_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/delete_insurance_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/fetch_my_insurances_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Bloc/Repository/delete_center_doctor_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Bloc/Repository/fetch_center_doctor_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyAssistantDataFeature/Bloc/Repo/delete_assistant_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/delete_services_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/fetch_my_services_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FetchCenterDoctorController extends GetxController {
  int centerId;

  FetchCenterDoctorController({required this.centerId});

  List<CenterDoctorModel> _centerDoctorList = [];
  List<CenterDoctorModel> get centerDoctorList => _centerDoctorList;
  RequestStatus status = RequestStatus.initial;
  // void addAssistantLocal(AssistantModel newAssistant){
  //   myAssistantList.insert(0, newAssistant);
  //   update();
  // }
  final FetchCenterDoctorRepository _fetchCenterDoctorRepository = FetchCenterDoctorRepository();
  Future<void> fetchCenterDoctor() async {
    status = RequestStatus.loading;
    var response = await _fetchCenterDoctorRepository.fetchCenterDoctor(centerId:centerId);
    status = RequestStatus.done;
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _centerDoctorList.clear();
      for (var item in response.data['data']) {
        _centerDoctorList.add(CenterDoctorModel.fromJson(item));
      }
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    } else {
      status = RequestStatus.error;
      update();
    }
  }


  final DeleteCenterDoctorRepository _deleteCenterDoctorRepository = DeleteCenterDoctorRepository();
  Future<void> deleteCenterDoctor({required int doctorId, required int index}) async {
    _centerDoctorList.removeAt(index);
    update();
    // setLoading();
    // var response = await _deleteCenterDoctorRepository.deleteCenterDoctor(doctorId:  doctorId);
    // Get.back();
    // if (response.statusCode == 200 && response.data["status"] == true) {
    //   debugPrint("request operation success");
    //   _centerDoctorList.clear();
    //   for (var item in response.data['data']) {
    //     _centerDoctorList.add(CenterDoctorModel.fromJson(item));
    //   }
    //   debugPrint("convert operation success");
    //   status = RequestStatus.done;
    //   update();
    //   customSnackBar(title: "delete_success".tr);
    // } else {
    //   status = RequestStatus.error;
    //   customSnackBar(title: response.data["message"]??"Error");
    //   update();
    // }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCenterDoctor();
  }
}

//
// import 'package:dr_dent/Src/bloc/model/assitant_model.dart';
// import 'package:dr_dent/Src/bloc/model/center_doctor_model.dart';
// import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
// import 'package:dr_dent/Src/bloc/model/service_model.dart';
// import 'package:dr_dent/Src/core/services/dialogs.dart';
// import 'package:dr_dent/Src/core/utils/request_status.dart';
// import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/delete_insurance_repo.dart';
// import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/fetch_my_insurances_repo.dart';
// import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Bloc/Repository/delete_center_doctor_repo.dart';
// import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Bloc/Repository/fetch_center_doctor_repo.dart';
// import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyAssistantDataFeature/Bloc/Repo/delete_assistant_repo.dart';
// import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/delete_services_repo.dart';
// import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/fetch_my_services_repo.dart';
// import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
// import 'package:get/get.dart';
//
// class FetchCenterDoctorController extends GetxController {
//   int centerId;
//   FetchCenterDoctorController({required this.centerId});
//   List<CenterDoctorModel> _centerDoctorList = [];
//   List<CenterDoctorModel> get centerDoctorList => _centerDoctorList;
//   RequestStatus status = RequestStatus.initial;
//   // void addAssistantLocal(AssistantModel newAssistant){
//   //   myAssistantList.insert(0, newAssistant);
//   //   update();
//   // }
//   final FetchCenterDoctorRepository _fetchCenterDoctorRepository = FetchCenterDoctorRepository();
//   Future<void> fetchCenterDoctor() async {
//     _centerDoctorList = [...centerDoctorExample];
//     update();
//     // var response = await _fetchCenterDoctorRepository.fetchCenterDoctor();
//     // if (response.statusCode == 200 && response.data["status"] == true) {
//     //   debugPrint("request operation success");
//     //   _centerDoctorList.clear();
//     //   for (var item in response.data['data']) {
//     //     _centerDoctorList.add(CenterDoctorModel.fromJson(item));
//     //   }
//     //   debugPrint("convert operation success");
//     //   status = RequestStatus.done;
//     //   update();
//     // } else {
//     //   status = RequestStatus.error;
//     //   update();
//     // }
//   }
//
//
//   final DeleteCenterDoctorRepository _deleteCenterDoctorRepository = DeleteCenterDoctorRepository();
//   Future<void> deleteCenterDoctor({required int doctorId, required int index}) async {
//     _centerDoctorList.removeAt(index);
//     update();
//     // setLoading();
//     // var response = await _deleteCenterDoctorRepository.deleteCenterDoctor(doctorId:  doctorId);
//     // Get.back();
//     // if (response.statusCode == 200 && response.data["status"] == true) {
//     //   debugPrint("request operation success");
//     //   _centerDoctorList.clear();
//     //   for (var item in response.data['data']) {
//     //     _centerDoctorList.add(CenterDoctorModel.fromJson(item));
//     //   }
//     //   debugPrint("convert operation success");
//     //   status = RequestStatus.done;
//     //   update();
//     //   customSnackBar(title: "delete_success".tr);
//     // } else {
//     //   status = RequestStatus.error;
//     //   customSnackBar(title: response.data["message"]??"Error");
//     //   update();
//     // }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchCenterDoctor();
//   }
// }
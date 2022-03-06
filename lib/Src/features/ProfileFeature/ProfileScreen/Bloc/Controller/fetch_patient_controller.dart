import 'package:dr_dent/Src/bloc/model/followers_model.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Repo/patient_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Repo/following_repo.dart';

class FetchPatientController extends GetxController {
  final int userId ;

  FetchPatientController({required this.userId});

  List<FollowersModel> _patientList=[];
  List<FollowersModel> get patientList => _patientList;
  RequestStatus status = RequestStatus.initial;
  final PatientRepository _patientRepository = PatientRepository();

  Future<void> fetchFollowing() async {
    status = RequestStatus.loading;
    var response = await _patientRepository.fetchPatient(userId: userId);
    status = RequestStatus.done;
    update();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _patientList.clear();
      for (var item in response.data['data']) {
        _patientList.add(FollowersModel.fromJson(item));
      }
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    } else {
      status = RequestStatus.error;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchFollowing();
  }
}

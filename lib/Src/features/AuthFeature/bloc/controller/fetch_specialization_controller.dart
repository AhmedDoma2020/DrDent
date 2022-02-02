import 'package:dr_dent/Src/bloc/model/specialization_model.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/fetch_specialization_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FetchSpecializationController extends GetxController {
  List<SpecializationModel> _specializationList = [];

  List<SpecializationModel> get specializationList => _specializationList;
  List<int> _specializationIdList = [];

  List<int> get specializationIdList => _specializationIdList;
  List<String> _specializationTitleList = [];

  List<String> get specializationTitleList => _specializationTitleList;



  void changeSelectInsuranceActive({required int id}) {
    int insuranceIndex =
        _specializationList.indexWhere((element) => element.id == id);
    debugPrint("insuranceIndex is $insuranceIndex");
    _specializationList[insuranceIndex].active =
        !_specializationList[insuranceIndex].active;
    update();
  }

  RequestStatus status = RequestStatus.initial;
  final FetchSpecializationRepository _fetchSpecializationRepository =
      FetchSpecializationRepository();

  Future<void> fetchSpecialization() async {
    // setLoading();
    var response = await _fetchSpecializationRepository.fetchSpecialization();
    // Get.back();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _specializationList.clear();
      for (var item in response.data['data']) {
        _specializationList.add(SpecializationModel.fromJson(item));
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
    fetchSpecialization();
    _specializationIdList = [];
    _specializationTitleList = [];
  }
}

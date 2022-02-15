


import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/bloc/model/service_model.dart';
import 'package:dr_dent/Src/bloc/model/univeristy_model.dart';
import 'package:dr_dent/Src/bloc/repository/fetch_university_repo.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/fetch_available_insurances_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Bloc/Repository/featch_job_title_and_specialization_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Bloc/Repository/featch_job_title_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/fetch_available_services_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FetchJobTitleController extends GetxController {
  List<ChoiceModel> _jobTitleList = [];
  List<ChoiceModel> get jobTitleList => _jobTitleList;

  int _choiceSIndex = -1;
  int get choiceSIndex => _choiceSIndex;
  void changeChoiceIndex(value) {
    _choiceSIndex = value;
    update();
  }
  RequestStatus status = RequestStatus.initial;

  final FetchJobTitleRepository _fetchJobTitleRepository = FetchJobTitleRepository();
  Future<void> fetchJobTitle() async {
    status = RequestStatus.loading;
    var response = await _fetchJobTitleRepository.fetchJobTitle();
    status = RequestStatus.done;
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _jobTitleList.clear();
      for (var item in response.data['data']) {
        _jobTitleList.add(ChoiceModel.fromJson(item));
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
    fetchJobTitle();
  }
}


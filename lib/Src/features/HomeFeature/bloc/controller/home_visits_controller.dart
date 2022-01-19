import 'package:dr_dent/Src/bloc/model/visit.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/HomeFeature/bloc/repository/home_visits_repository.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_offer.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_offers_repository.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeVisitsController extends GetxController {
  RequestStatus status = RequestStatus.initial;

  List<Visit> _newVisits = [];
  List<Visit> get newVisits => _newVisits;
  List<Visit> _nextVisits = [];
  List<Visit> get nextVisits => _nextVisits;

// ========== START FETCH DATA  ====================
  final HomeVisitsRepository _homeVisitsRepository = HomeVisitsRepository();
  Future<void> fetchHomeVisits() async {
    status = RequestStatus.loading;
    update();
    var response = await _homeVisitsRepository.fetchHomeVisits();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _newVisits.clear();
      _nextVisits.clear();
      if (response.data['data']['next_visits'] != null) {
        for (var item in response.data['data']['next_visits']) {
          newVisits.add(Visit.fromJson(item));
        }
      }
      if (response.data['data']['new_visits'] != null) {
        for (var item in response.data['data']['new_visits']) {
          nextVisits.add(Visit.fromJson(item));
        }
      }
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    } else {
      status = RequestStatus.error;
      update();
    }
  }
// ================  END FETCH DATA  ====================

  @override
  void onInit() {
    super.onInit();
    fetchHomeVisits();
  }
}

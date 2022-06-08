import 'package:dr_dent/Src/bloc/model/visit.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/HomeFeature/bloc/repository/delete_requests_repository.dart';
import 'package:dr_dent/Src/features/HomeFeature/bloc/repository/home_visits_repository.dart';
import 'package:dr_dent/Src/features/HomeFeature/bloc/repository/information_requests_repository.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_offer.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_offers_repository.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/info_requets_model.dart';

class InformationRequestsController extends GetxController {
  RequestStatus status = RequestStatus.initial;

  List<InfoRequestModel> _requests = [];
  List<InfoRequestModel> get requests => _requests;

// ========== START FETCH DATA  ====================
  final InformationRequestsRepository _informationRequestsRepository = InformationRequestsRepository();
  Future<void> fetchInformationRequests() async {
    status = RequestStatus.loading;
    update();
    var response = await _informationRequestsRepository.fetchInformationRequest();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      debugPrint("response.data['data'] in social ${response.data['data']}");
      _requests.clear();
      if (response.data['data'] != null) {
        for (var item in response.data['data']) {
          _requests.add(InfoRequestModel.fromJson(item));
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


  final DeleteRequestsRepository _deleteRequestsRepository = DeleteRequestsRepository();
  Future<void> deleteInformationRequests({required int requestIndex}) async {
    status = RequestStatus.loading;
    update();
    var response = await _deleteRequestsRepository.deleteRequests(id: _requests[requestIndex].id);
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _requests.removeAt(requestIndex);
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
    fetchInformationRequests();
  }
}

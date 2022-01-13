import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_offers_repository.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class JobOffersController extends GetxController{
  RequestStatus status = RequestStatus.initial;
  List<JobRequest> _jobRequests = [];
  List<JobRequest> get jobRequests => _jobRequests;

  // ========== START FETCH DATA  ====================
  final JobOffersRepository _jobOffersRepository = JobOffersRepository();
  Future<void> fetchJobOffers()async{
    status = RequestStatus.loading;
    update();
    var response = await _jobOffersRepository.fetchJobOffers();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      if(response.data['data']!=null){
        _jobRequests.clear();
        for (var item in response.data['data']) {
          _jobRequests.add(JobRequest.fromJson(item));
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
    fetchJobOffers();
  }

}
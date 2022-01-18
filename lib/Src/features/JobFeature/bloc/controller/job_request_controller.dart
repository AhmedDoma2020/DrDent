import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class JobRequestController extends GetxController{
  RequestStatus status = RequestStatus.initial;
  List<JobRequest> _jobRequests = [];
  List<JobRequest> get jobRequests => _jobRequests;

  // ========== START FETCH DATA  ====================
  final JobRequestsRepository _jobRequestsRepository = JobRequestsRepository();
  Future<void> fetchJobRequests()async{
    status = RequestStatus.loading;
    update();
    var response = await _jobRequestsRepository.fetchJobRequests();
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
    fetchJobRequests();
  }

}
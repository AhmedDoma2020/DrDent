import 'dart:ffi';

import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/services/dialogs.dart';
import '../Repository/delete_jop_request_repo.dart';

class JobRequestController extends GetxController{
  RequestStatus status = RequestStatus.initial;
  List<JobRequest> _jobRequests = [];
  List<JobRequest> get jobRequests => _jobRequests;

  List<JobRequest> _myJobRequests = [];
  List<JobRequest> get myJobRequests => _myJobRequests;

  // ========== START FETCH DATA  ====================
  final JobRequestsRepository _jobRequestsRepository = JobRequestsRepository();
  Future<void> fetchJobRequests({VoidCallback? onSuccess , bool forceLoading=true})async{
    if(forceLoading){
      status = RequestStatus.loading;
      update();
    }
    var response = await _jobRequestsRepository.fetchJobRequests();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _jobRequests.clear();
      if(response.data['data']!=null){
        for (var item in response.data['data']) {
          _jobRequests.add(JobRequest.fromJson(item));
        }
      }
      if(response.data['my_job_requests']!=null){
        for (var item in response.data['my_job_requests']) {
          _myJobRequests.add(JobRequest.fromJson(item));
        }
      }
      debugPrint("convert operation success");
      if(onSuccess!=null){
        onSuccess();
      }
      status = RequestStatus.done;
      update();
    }else{
      status = RequestStatus.done;
      update();
    }
  }
  // ================  END FETCH DATA  ====================



  // ========== START DELETE DATA  ====================
  final DeleteJopRequestRepository _deleteJopRequestRepository = DeleteJopRequestRepository();
  Future<void> deleteRequest({required int id})async{
    setLoading();
    var response = await _deleteJopRequestRepository.deleteJopRequest(id: id);
    if (response.statusCode == 200 && response.data["status"] == true) {
      fetchJobRequests(onSuccess: (){Get.back();},forceLoading: false);
    }else{
      Get.back();
    }
  }
  // ================  END DELETE DATA  ====================



  @override
  void onInit() {
    super.onInit();
    fetchJobRequests();
  }

}

import 'package:dr_dent/Src/bloc/model/visit.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/VisitsFeature/ui/bloc/repository/visits_new_repository.dart';
import 'package:dr_dent/Src/features/VisitsFeature/ui/bloc/repository/visits_waiting_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class VisitsWaitingController extends GetxController{
  RequestStatus status = RequestStatus.initial;
  List<Visit> visits = [];


  FetchWaitingVisitsRepository _fetchWaitingVisitsRepository = FetchWaitingVisitsRepository();
  Future<void> fetchWaitingVisits()async{
    status = RequestStatus.loading;
    update();
    // TODO unComment this lines
    var response = await _fetchWaitingVisitsRepository.fetchWaitingVisits();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      if(response.data['data']!=null){
        visits.clear();
        for (var item in response.data['data']) {
          visits.add(Visit.fromJson(item));
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





  @override
  void onInit() {
    super.onInit();
    fetchWaitingVisits();
  }

}
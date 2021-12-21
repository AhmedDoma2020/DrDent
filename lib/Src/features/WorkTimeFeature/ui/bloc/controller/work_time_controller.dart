import 'package:dr_dent/Src/bloc/model/day_model.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkTimeController extends GetxController{
  RequestStatus status = RequestStatus.initial;
  late TextEditingController detectionTime;
  List<DayModel> days = [];

  void expandDay({required int dayIndex}){
    days[dayIndex].expanded = !days[dayIndex].expanded;
    update();
  }


  Future<void> fetchDays()async{
    status = RequestStatus.loading;
    update();
    days = dayExamples;
    status = RequestStatus.done;
    update();
    // var response = await _homeRepository.home();
    // if (response.statusCode == 200 && response.data["status"] == true) {
    //   print("request operation success");
    //   waitingOrders.clear();
    //   underDelivery.clear();
    //   onWayDelivery.clear();
    //   for (var item in response.data['waitingOrder']) {
    //     waitingOrders.add(Order.fromJson(item));
    //   }
    //   for (var item in response.data['underdeliveryOrder']) {
    //     underDelivery.add(Order.fromJson(item));
    //   }
    //   for (var item in response.data['onWayOrder']) {
    //     onWayDelivery.add(Order.fromJson(item));
    //   }
    //
    //   print("convert operation success");
    //   status = RequestStatus.done;
    //   update();
    // }else{
    //   status = RequestStatus.error;
    //   update();
    // }
  }





  Future<void> addDayTime()async{
    status = RequestStatus.loading;
    update();
    days = dayExamples;
    status = RequestStatus.done;
    update();
    // var response = await _homeRepository.home();
    // if (response.statusCode == 200 && response.data["status"] == true) {
    //   print("request operation success");
    //   for (var item in response.data['waitingOrder']) {
    //     waitingOrders.add(Order.fromJson(item));
    //   }
    //   print("convert operation success");
    //   status = RequestStatus.done;
    //   update();
    // }else{
    //   status = RequestStatus.error;
    //   update();
    // }
  }


  @override
  void onInit() {
    detectionTime = TextEditingController();
    fetchDays();
    super.onInit();
  }
}
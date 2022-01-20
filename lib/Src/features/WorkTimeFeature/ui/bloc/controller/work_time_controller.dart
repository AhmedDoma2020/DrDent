import 'package:dr_dent/Src/bloc/model/day_model.dart';
import 'package:dr_dent/Src/bloc/model/day_time_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/repository/add_day_time_details_repository.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/repository/add_day_time_repository.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/repository/delete_day_time_repository.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/repository/fetch_days_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkTimeController extends GetxController{
  RequestStatus status = RequestStatus.initial;
  late TextEditingController detectionTime;
  late int dayBookingType;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();


  List<DayModel> days = [];

  void expandDay({required int dayIndex}){
    days[dayIndex].expanded = !days[dayIndex].expanded;
    update();
  }

 final FetchDaysRepository _fetchDaysRepository = FetchDaysRepository();

  Future<void> fetchDays()async{
    status = RequestStatus.loading;
    update();
    var response = await _fetchDaysRepository.fetchDays();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      days.clear();
      for (var item in response.data['data']) {
        days.add(DayModel.fromJson(item));
      }
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    }else{
      status = RequestStatus.error;
      update();
    }
  }

  final AddDayTimeRepository _addDayTimeRepository = AddDayTimeRepository();
  Future<void> addDayTime({required int dayId , required DayTimeModel dayTime,required int workSpaceId,required int doctorId})async{
    setLoading();
    var response = await _addDayTimeRepository.addDayTime(
        dayId: dayId,
        dayTime: dayTime,
        workSpaceId: workSpaceId,
        doctorId: doctorId
    );
    Get.back();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      int dayIndex = days.indexWhere((element) => element.id == dayId);
      if(response.data["data"]!=null){
        days[dayIndex].times!.add(DayTimeModel.fromJson(response.data["data"]));
      }
      debugPrint("convert operation success");
      update();
    }else{
    }
  }


  final DeleteDayTimeRepository _deleteDayTimeRepository = DeleteDayTimeRepository();
  Future<void> deleteDayTime({required int dayTimeId , required int dayId})async{
    setLoading();
    var response = await _deleteDayTimeRepository.deleteDayTime(
     dayTimeId: dayTimeId
    );
    Get.back();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      int dayIndex = days.indexWhere((element) => element.id == dayId);
      int dayTimeIndex = days[dayIndex].times!.indexWhere((element) => element.id == dayTimeId);
      days[dayIndex].times!.removeAt(dayTimeIndex);
      debugPrint("convert operation success");
      update();
    }else{
    }
  }


  final AddDayTimeDetailsRepository _addDayTimeDetailsRepository = AddDayTimeDetailsRepository();
  Future<void> addDayTimeDetails()async{
    if(globalKey.currentState!.validate()){
      globalKey.currentState!.save();
      setLoading();
      var response = await _addDayTimeDetailsRepository.addDayTimeDetails(detectionTime: detectionTime.text , dayBookingType: 1);
      Get.back();
      if (response.statusCode == 200 && response.data["status"] == true) {
        debugPrint("request operation success");

        debugPrint("convert operation success");
        update();
      }else{
      }
    }
  }

  @override
  void onInit() {
    detectionTime = TextEditingController();
    fetchDays();
    super.onInit();
  }
}
import 'package:dr_dent/Src/bloc/model/day_model.dart';
import 'package:dr_dent/Src/bloc/model/day_time_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/repository/Center/add_day_time_for_center_repository.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/repository/Center/delete_day_time_for_center_repository.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/repository/Center/fetch_days_for_center_repository.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/repository/Company/add_day_time_for_company_repository.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/repository/Company/delete_day_time_for_company_repository.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/repository/Company/fetch_days_for_company_repository.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/repository/Doctor/delete_day_time_repository.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/Doctor/add_day_time_details_repository.dart';
import '../repository/Doctor/add_day_time_repository.dart';
import '../repository/Doctor/fetch_days_repository.dart';

enum UserTypeEnum {
  doctor,
  center,
  graduated,
  company,
  lab,
}

class WorkTimeController extends GetxController {
  RequestStatus status = RequestStatus.initial;
  late TextEditingController detectionTime;
  late TextEditingController dayBookingController;
  int? _dayBookingType;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();






  final int? workSpaceId;
  final int? doctorId;
  final UserTypeEnum userType;
  final bool isEdit;
  final String fetchDetectionTime;
  final String fetchDayBooking;
  final int? dayBookingTypeEdit;

  WorkTimeController({
    this.isEdit = false,
    this.workSpaceId,
    this.doctorId,
    this.userType = UserTypeEnum.doctor,
    this.fetchDayBooking = '',
    this.fetchDetectionTime = '',
    this.dayBookingTypeEdit
  });

  List<String> dayBookingTitles = [
    'قبول الحجوزات في نفس اليوم',
    'قبول الحجوزات قبلها بيوم'
  ];

  int get dayBookingType => _dayBookingType!;

  set dayBookingType(int value) {
    _dayBookingType = value;
    dayBookingController.text = dayBookingTitles[value];
    update();
  }

  List<DayModel> days = [];

  void expandDay({required int dayIndex}) {
    days[dayIndex].expanded = !days[dayIndex].expanded;
    update();
  }

  void setDetectionTimeAndDayBooking() {
    detectionTime.text = fetchDetectionTime;
    // dayBookingController.text = fetchDayBooking;
    update();
  }

  final FetchDaysRepository _fetchDaysRepository = FetchDaysRepository();
  final FetchDaysForCenterRepository _fetchDaysForCenterRepository =
      FetchDaysForCenterRepository();
  final FetchDaysForCompanyRepository _fetchDaysForCompanyRepository =
      FetchDaysForCompanyRepository();

  Future<void> fetchDays() async {
    status = RequestStatus.loading;
    debugPrint("userType in workTime controller is in fetchDays$userType");
    update();
    late var response;
    if (userType == UserTypeEnum.doctor) {
      response = await _fetchDaysRepository.fetchDays(
          workspaceId: workSpaceId!, doctorId: doctorId!);
    } else if (userType == UserTypeEnum.center) {
      response = await _fetchDaysForCenterRepository.fetchDaysForCenter(
          workspaceId: workSpaceId!);
    } else if (userType == UserTypeEnum.company) {
      response = await _fetchDaysForCompanyRepository.fetchDaysForCompany();
    }

    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      days.clear();
      for (var item in response.data['data']) {
        days.add(DayModel.fromJson(item));
      }
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    } else {
      status = RequestStatus.error;
      update();
    }
  }

  final AddDayTimeRepository _addDayTimeRepository = AddDayTimeRepository();
  final AddDayTimeForCenterRepository _addDayTimeForCenterRepository =
      AddDayTimeForCenterRepository();
  final AddDayTimeForCompanyRepository _addDayTimeForCompanyRepository =
      AddDayTimeForCompanyRepository();

  Future<void> addDayTime(
      {required int dayId, required DayTimeModel dayTime}) async {
    debugPrint("userType in workTime controller is in addDayTime$userType");
    late var response;
    setLoading();
    if (userType == UserTypeEnum.doctor) {
      response = await _addDayTimeRepository.addDayTime(
          dayId: dayId,
          dayTime: dayTime,
          workSpaceId: workSpaceId!,
          doctorId: doctorId!);
    } else if (userType == UserTypeEnum.center) {
      response = await _addDayTimeForCenterRepository.addDayTimeForCenter(
        dayId: dayId,
        dayTime: dayTime,
        workSpaceId: workSpaceId!,
      );
    } else if (userType == UserTypeEnum.company) {
      response = await _addDayTimeForCompanyRepository.addDayTimeForCompany(
        dayId: dayId,
        dayTime: dayTime,
      );
    }
    Get.back();
    if (response.statusCode == 200 && response.data["status"] == true) {
      customSnackBar(title: response.data["message"] ?? "Error");
      debugPrint("request operation success");
      int dayIndex = days.indexWhere((element) => element.id == dayId);
      if (response.data["data"] != null) {
        days[dayIndex].times!.add(DayTimeModel.fromJson(response.data["data"]));
      }
      debugPrint("convert operation success");
      update();
    } else {
      customSnackBar(title: response.data["message"] ?? "Error");
    }
  }

  final DeleteDayTimeRepository _deleteDayTimeRepository =
      DeleteDayTimeRepository();
  final DeleteDayTimeForCenterRepository _deleteDayTimeForCenterRepository =
      DeleteDayTimeForCenterRepository();
  final DeleteDayTimeForCompanyRepository _deleteDayTimeForCompanyRepository =
      DeleteDayTimeForCompanyRepository();

  Future<void> deleteDayTime(
      {required int dayTimeId, required int dayId}) async {
    debugPrint("userType in workTime controller is in deleteDayTime $userType");
    late var response;
    setLoading();
    if (userType == UserTypeEnum.doctor) {
      response =
          await _deleteDayTimeRepository.deleteDayTime(dayTimeId: dayTimeId);
    } else if (userType == UserTypeEnum.center) {
      response = await _deleteDayTimeForCenterRepository.deleteDayTimeForCenter(dayTimeId: dayTimeId);
    } else if (userType == UserTypeEnum.company) {
      response = await _deleteDayTimeForCompanyRepository
          .deleteDayTimeForCompany(dayTimeId: dayTimeId);
    }
    Get.back();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      int dayIndex = days.indexWhere((element) => element.id == dayId);
      int dayTimeIndex = days[dayIndex]
          .times!
          .indexWhere((element) => element.id == dayTimeId);
      days[dayIndex].times!.removeAt(dayTimeIndex);
      customSnackBar(title: response.data["message"] ?? "Error");
      debugPrint("convert operation success");
      update();
    } else {
      customSnackBar(title: response.data["message"] ?? "Error");
    }
  }

  final AddDayTimeDetailsRepository _addDayTimeDetailsRepository =
      AddDayTimeDetailsRepository();

  Future<void> addDayTimeDetails({required VoidCallback onSuccess}) async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      setLoading();
      var response = await _addDayTimeDetailsRepository.addDayTimeDetails(
          detectionTime: detectionTime.text,
          dayBookingType: _dayBookingType ?? 0,
          workspaceId: workSpaceId!,
          doctorId: doctorId!);
      Get.back();
      if (response.statusCode == 200 && response.data["status"] == true) {
        debugPrint("request operation success");
        onSuccess();
        customSnackBar(title: response.data["message"] ?? "");
        debugPrint("convert operation success");
        update();
      } else {
        customSnackBar(title: response.data["message"] ?? "");
        update();
      }
    }
  }

  @override
  void onInit() {
    detectionTime = TextEditingController();
    dayBookingController = TextEditingController();
    if(dayBookingTypeEdit!=null){
      print('ahmed fathy $dayBookingTypeEdit');
      _dayBookingType = dayBookingTypeEdit;
      dayBookingController.text = dayBookingTitles[dayBookingTypeEdit!];
      update();
    }
    if (isEdit) setDetectionTimeAndDayBooking();
    fetchDays();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    detectionTime.dispose();
    dayBookingController.dispose();
  }
}

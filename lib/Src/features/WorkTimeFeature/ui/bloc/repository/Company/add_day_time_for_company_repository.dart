import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/bloc/model/day_time_model.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';

class AddDayTimeForCompanyRepository with ApiKey {
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> addDayTimeForCompany({
    required dayId,
    required DayTimeModel dayTime,
  }) async {
    debugPrint("dayId in AddDayTime repo $dayId");
    debugPrint("dayTime in AddDayTime repo $dayTime");
    Response? response;
    try {
      response =
          await _networkService.post(url: uRLAddDayTimeForCompany, auth: true, body: {
        'start_time': dayTime.startTime,
        'end_time': dayTime.endTime,
        'day_id': dayId,
      });
    } on SocketException {
      throw const SocketException('No Internet Connection');
    } on Exception {
      throw UnKnownException('there is unKnown Exception');
    } catch (e) {
      throw UnKnownException(e.toString());
    }
    return response;
  }
}

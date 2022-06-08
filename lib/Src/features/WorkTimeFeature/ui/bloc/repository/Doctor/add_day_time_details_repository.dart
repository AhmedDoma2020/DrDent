import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/bloc/model/day_time_model.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';


class AddDayTimeDetailsRepository with ApiKey{
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> addDayTimeDetails({
    required String detectionTime,
    required int dayBookingType,
    required int workspaceId,
    required int doctorId,
  })async{
    debugPrint("dayBookingType in repo $dayBookingType");
    debugPrint("detectionTime in repo $detectionTime");
    Response? response;
    try{
      response = await _networkService.post(
          url:  uRLAddWorkSpaceDetails,
          auth: true,
        body: {
            'work_space_id':workspaceId,
            'doctor_id':doctorId,
            'detection_time': detectionTime,
            'reservation_type' : dayBookingType,
        }
      );

    }on SocketException{
      throw const SocketException('No Internet Connection');
    }on Exception{
      throw UnKnownException('there is unKnown Exception');
    }catch (e){
      throw UnKnownException(e.toString());
    }
    return response;
  }
}

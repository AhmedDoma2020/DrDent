import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/bloc/model/day_time_model.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:get_storage/get_storage.dart';


class AddDayTimeRepository with ApiKey{
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> addDayTime({required int doctorId, required dayId , required int workSpaceId , required DayTimeModel dayTime})async{
    Response? response;
    try{
      response = await _networkService.post(
          url:  uRLAddDayTime,
          auth: true,
        body: {
            'work_space_id':workSpaceId,
            'start_time' : dayTime.startTime,
            'end_time' : dayTime.endTime,
            'emergency_bookings' : dayTime.numberOfEmergencyVisits,
            'day_id' : dayId,
            'doctor_id' : doctorId,
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

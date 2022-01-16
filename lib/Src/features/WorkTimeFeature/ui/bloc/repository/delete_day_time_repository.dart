import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:get_storage/get_storage.dart';


class DeleteDayTimeRepository with ApiKey{
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> deleteDayTime({required int dayTimeId})async{
    Response? response;
    try{
      response = await _networkService.post(
          url:  uRLDeleteDayTime,
          auth: true,
        body: {
            'day_time_id':dayTimeId,
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

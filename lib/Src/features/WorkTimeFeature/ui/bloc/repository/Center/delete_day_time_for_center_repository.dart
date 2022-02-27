import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';


class DeleteDayTimeForCenterRepository with ApiKey{
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> deleteDayTimeForCenter({required int dayTimeId})async{
    debugPrint("dayTimeId in repo is $dayTimeId");
    Response? response;
    try{
      response = await _networkService.post(
          url:  uRLDeleteDayTimeForCenter,
          auth: true,
        body: {
            'center_day_id':dayTimeId,
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

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';
class SetServicesRepository with ApiKey{
  final NetworkService _networkService = NetworkService();
  Future<Response> setServices({required String servicePrice,required int serviceId,required String serviceTime,})async{
    Response response;
    debugPrint("servicePrice :> $servicePrice");
    debugPrint("serviceId :> $serviceId");
    debugPrint("serviceTime :> $serviceTime");
    try{
      response = await _networkService.post(
        url:uRLSetService,
        auth: true,
        body: {
          "service_id": serviceId,
          "waiting_time": serviceTime,
          "price": servicePrice,
        },
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

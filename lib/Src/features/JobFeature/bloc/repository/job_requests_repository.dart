import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:get_storage/get_storage.dart';


class JobRequestsRepository with ApiKey{
  // GetStorage box = GetStorage();
  NetworkService _networkService = NetworkService();
  Future<Response> fetchJobRequests()async{
    Response? response;
    try{
      response = await _networkService.post(
          url:  uRLFetchJobRequests,
          auth: true
      );
    }on SocketException{
      throw SocketException('No Internet Connection');
    }on Exception{
      throw UnKnownException('there is unKnown Exception');
    }catch (e){
      throw UnKnownException(e.toString());
    }
    return response;
  }
}

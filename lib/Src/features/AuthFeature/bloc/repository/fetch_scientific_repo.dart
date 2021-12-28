
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';


class FetchScientificRepository with ApiKey{
  // GetStorage box = GetStorage();
  NetworkService _networkService = NetworkService();
  Future<Response> fetchScientific()async{
    Response response;
    try{
      response = await _networkService.get(
        url:uRLFetchScientific,
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

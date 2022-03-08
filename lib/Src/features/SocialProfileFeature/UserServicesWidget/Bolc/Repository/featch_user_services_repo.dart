
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';
class FetchUserServicesRepository with ApiKey{
  final NetworkService _networkService = NetworkService();
  Future<Response> fetchUSerServices({required int userId})async{
    Response response;
    debugPrint("userId in repo is $userId");

    try{
      response = await _networkService.post(
        url:uRLFetchUserServices,
        auth: true,
        body: {
          "user_id":userId,
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

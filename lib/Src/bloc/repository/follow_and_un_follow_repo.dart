import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';


class FollowAndUnFollowRepository with ApiKey{
  final NetworkService _networkService = NetworkService();
  Future<Response> followAndUnFollow({
  required int userId,
})async{
    debugPrint('userId in followRepo $userId');
    Response response;
    try{
      response = await _networkService.post(
        url: uRLFollowAndUnFollow,
        body: {
          'user_id':userId,
        },
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



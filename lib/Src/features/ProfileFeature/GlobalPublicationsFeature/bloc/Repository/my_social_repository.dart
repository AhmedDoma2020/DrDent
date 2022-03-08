import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';


class MySocialRepository with ApiKey{
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> fetchMySocial({required int userId})async{
    Response? response;
    debugPrint('userId in MySocialRepository is $userId');
    try{
      response = await _networkService.post(
          url:  uRLFetchMyPosts,
          auth: true,
        body: {
          "user_id":userId,
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

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';

class LogInRepository with ApiKey {
  // GetStorage box = GetStorage();
  NetworkService _networkService = NetworkService();

  Future<Response> logIn({
    required String phone,
    required String password,
  }) async {
    Response response;
    try {
      response = await _networkService.post(
          url: uRLLogin,
          auth: true,
          body: {
            'phone':phone,
            'password':password,
            // 'device_token':"",
            // 'device_id':deviceId,
            // 'device_type':deviceType,
          }
      );
    } on SocketException {
      throw SocketException('No Internet Connection');
    } on Exception {
      throw UnKnownException('there is unKnown Exception');
    } catch (e) {
      throw UnKnownException(e.toString());
    }
    return response;
  }
}

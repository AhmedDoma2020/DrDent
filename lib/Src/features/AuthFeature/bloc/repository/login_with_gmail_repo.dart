import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';

class LogInWithEmailRepository with ApiKey {
  // GetStorage box = GetStorage();
  NetworkService _networkService = NetworkService();

  Future<Response> logInWithEmail({
    required String gmail,
    required String googleId,
    int? deviceId,
    String? deviceType,
  }) async {
    Response response;
    try {
      response = await _networkService.post(
          url: uRLLoginWithEmail,
          auth: true,
          body: {
            'gmail':gmail,
            'google_id':googleId,
            'device_token': "",
            'device_id':deviceId,
            'device_type':deviceType,
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

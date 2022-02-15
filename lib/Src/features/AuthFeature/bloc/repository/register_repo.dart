import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';

class RegisterRepository with ApiKey {
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> register({
    required String name,
    required String phone,
    required String image,
    required int userType,
    required String administratorName,
    required String administratorPhone,
    required String password,
    int? deviceId,
    String? deviceType,
  }) async {
    Response response;
    try {
      response = await _networkService.post(
          url: uRLRegister,
          body: {
            'name':name,
            'phone':phone,
            'image':image,
            'user_type':userType,
            'password':password,
            'adminstrator_name':administratorName,
            'adminstrator_phone':administratorPhone,
            'code':"20",
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

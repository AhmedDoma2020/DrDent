import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LogInRepository with ApiKey {
  // GetStorage box = GetStorage();
  NetworkService _networkService = NetworkService();


  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  Future<Response> logIn({
    required String phone,
    required String password,
  }) async {
    Response response;
    String? token = '';
    try{
      token = await _fcm.getToken();
    }catch(e){
      print('an error occur in fetch token');
    }

    try {
      response = await _networkService.post(
          url: uRLLogin,
          auth: true,
          body: {
            'phone':phone,
            'password':password,
            'device_token':token,
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

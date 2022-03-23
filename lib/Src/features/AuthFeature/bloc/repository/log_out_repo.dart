import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LogOutRepository with ApiKey {

  final NetworkService _networkService = NetworkService();
  Future<Response> logOut() async {
    Response response;
    try {
      response = await _networkService.get(
          url: uRLLogout,
          auth: true,
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

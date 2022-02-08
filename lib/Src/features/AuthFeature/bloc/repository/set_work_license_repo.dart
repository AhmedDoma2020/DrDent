import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';

class SetWorkLicenseRepository with ApiKey {
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> setWorkLicense({
    required String workLicense,
  }) async {
    log('work_lisence in repo is $workLicense');
    Response response;
    try {
      response = await _networkService.post(
          url: uRLSetWorkLicense,
          auth: true,
          body: {
            'work_lisence':workLicense,
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

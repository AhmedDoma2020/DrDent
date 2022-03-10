import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';

class FetchCenterDoctorRepository with ApiKey {
  final NetworkService _networkService = NetworkService();

  Future<Response> fetchCenterDoctor({required int centerId}) async {
    Response response;
    debugPrint("centerId in repo is $centerId");
    try {
      response = await _networkService.post(
        url: uRLFetchCenterDoctor,
        auth: true,
        body: {"center_id": centerId},
      );
    } on SocketException {
      throw const SocketException('No Internet Connection');
    } on Exception {
      throw UnKnownException('there is unKnown Exception');
    } catch (e) {
      throw UnKnownException(e.toString());
    }
    return response;
  }
}

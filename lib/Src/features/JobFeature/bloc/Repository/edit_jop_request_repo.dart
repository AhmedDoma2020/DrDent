import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';

class EditJopRequestRepository with ApiKey {
  // GetStorage box = GetStorage();
  NetworkService _networkService = NetworkService();

  Future<Response> editJopRequest({
    required int jobRequestId,
    required String ownerName,
    required String phone,
    required String address,
    required List<int> specializationId,
    required String cV,
  }) async {
    Response response;
    debugPrint("ownerName $ownerName");
    debugPrint("phone $phone");
    log("cV in EditJopRequestRepository  $cV");

    try {
      response = await _networkService.post(
          url: uRLEditJopRequest,
          auth: true,
          body: {
            'job_request_id':jobRequestId,
            'name':ownerName,
            'phone':phone,
            'address':address,
            'specializations':specializationId,
            'cv':cV,
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

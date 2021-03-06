import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';

class DeleteJopRequestRepository with ApiKey {
  // GetStorage box = GetStorage();
  NetworkService _networkService = NetworkService();
  Future<Response> deleteJopRequest({
    required int id,
  }) async {
    debugPrint("id in repo is $id");
    Response response;
    try {
      response = await _networkService.post(
          url: uRLDeleteJobRequest,
          auth: true,
          body: {
            'job_request_id':id,
          }
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

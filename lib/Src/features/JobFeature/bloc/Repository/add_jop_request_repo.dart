import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';

class AddJopRequestRepository with ApiKey {
  // GetStorage box = GetStorage();
  NetworkService _networkService = NetworkService();

  Future<Response> addJopRequest({
    required String name,
    required String phone,
    required String address,
    required List<int> specializationId,
    required String cV,
  }) async {
    Response response;
    debugPrint("ownerName $name");
    debugPrint("phone $phone");
    debugPrint("specializationId in repo  $specializationId");
    debugPrint("cV in repo  $cV");

    try {
      response = await _networkService.post(
          url: uRLAddJopRequest,
          auth: true,
          body: {
            'name':name,
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

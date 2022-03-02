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
    required String ownerName,
    required String phone,
    required String address,
    required List<int> specializationId,
    required String cV,
  }) async {
    Response response;
    debugPrint("ownerName $ownerName");
    debugPrint("phone $phone");
    debugPrint("address $address");

    try {
      response = await _networkService.post(
          url: uRLEditJopRequest,
          auth: true,
          body: {
            'owner_name':ownerName,
            'phone':phone,
            'address':address,
            'specialization_ids':specializationId,
            'c_v':cV,
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

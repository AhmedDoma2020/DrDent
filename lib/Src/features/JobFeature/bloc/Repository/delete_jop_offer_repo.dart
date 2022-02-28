import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';

class DeleteJopOfferRepository with ApiKey {
  // GetStorage box = GetStorage();
  NetworkService _networkService = NetworkService();

  Future<Response> deleteJopOffer({
    required int id,
  }) async {
    Response response;
    try {
      response = await _networkService.post(
          url: uRLDeleteJobOffer,
          auth: true,
          body: {
            'job_offer_id':id,
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

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';

class EditAJopOfferRepository with ApiKey {
  // GetStorage box = GetStorage();
  NetworkService _networkService = NetworkService();

  Future<Response> editAJopOffer({
    required String ownerName,
    required String phone,
    required String address,
    required int scientificLevel,
    required List<int> specializationId,
    required double startSalary,
    required double endSalary,
    required String jobType,
    required String description,
    required List<String> requirements,
  }) async {
    Response response;
    debugPrint("scientificLevel $scientificLevel");
    try {
      response = await _networkService.post(
          url: uRLEditJobOffer,
          auth: true,
          body: {
            'name':ownerName,
            'phone':phone,
            'address':address,
            'scientific_level_id':scientificLevel,
            'specializations':specializationId,
            'start_salary':startSalary,
            'end_salary':endSalary,
            'job_type':jobType,
            'city_id':5,
            'description':description,
            'requirements':requirements,
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

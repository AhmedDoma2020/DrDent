import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';

class AddAJopOfferRepository with ApiKey {
  // GetStorage box = GetStorage();
  NetworkService _networkService = NetworkService();

  Future<Response> addAJopOffer({
    required String ownerName,
    required String phone,
    required String address,
    required String scientificLevel,
    required List<int> specializationId,
    required double startSalary,
    required double endSalary,
    required String jobType,
    required String description,
    required List<String> requirements,
  }) async {
    Response response;
    try {
      response = await _networkService.post(
        url: uRLEnterAndEditMyPersonalData,
          auth: true,
          body: {
            'owner_name':ownerName,
            'phone':phone,
            'address':address,
            'seintific_level':scientificLevel,
            'specialization_ids':specializationId,
            'start_salary':startSalary,
            'end_salary':endSalary,
            'job_type':jobType,
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

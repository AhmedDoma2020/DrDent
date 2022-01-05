

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';

class AddCenterDoctorRepository with ApiKey {
  // GetStorage box = GetStorage();
  NetworkService _networkService = NetworkService();
  Future<Response> addCenterDoctor({
    required String name,
    required String phone,
    required String avatar,
    required int gender,
    required String jobTitle,
    required int specializationId,
    required String notes,
  }) async {
    Response response;
    try {
      response = await _networkService.post(
          url: uRLEnterAndEditMyPersonalData,
          auth: true,
          body: {
            'name':name,
            'phone':phone,
            'avatar':avatar,
            'gender':gender,
            'specialization_id':specializationId,
            'job_title':jobTitle,
            'notes':notes,
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

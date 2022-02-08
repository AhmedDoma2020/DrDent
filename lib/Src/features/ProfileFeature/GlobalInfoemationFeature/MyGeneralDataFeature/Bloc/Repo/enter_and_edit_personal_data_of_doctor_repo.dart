import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';

class EnterAndEditPersonalDataOfDoctorRepository with ApiKey {
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> enterAndEditPersonalDataOfDoctor({
    required String name,
    required String gender,
    required int scientificLevel,
    required List<int> specializationId,
    required String moreInfo,
    required String image,
    required String yearOfExperience,
  }) async {
    debugPrint("name in EnterAndEditPersonalData is $name");
    debugPrint("gender in EnterAndEditPersonalData is $gender");
    debugPrint("scientificLevel in EnterAndEditPersonalData is $scientificLevel");
    debugPrint("specializationId in EnterAndEditPersonalData is $specializationId");
    debugPrint("moreInfo in EnterAndEditPersonalData is $moreInfo");
    debugPrint("image in EnterAndEditPersonalData is $image");
    Response response;
    try {
      response = await _networkService.post(
        url: uRLEnterAndEditPersonalDataOfDoctor,
          auth: true,
          body: {
            'name':name,
            'gender':gender,
            'seintific_level':scientificLevel,
            'specializations':specializationId,
            'about':moreInfo,
            'work_lisence':image,
            'work_year':yearOfExperience,
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

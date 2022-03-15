

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';

class EditCenterDoctorRepository with ApiKey {
  // GetStorage box = GetStorage();
  NetworkService _networkService = NetworkService();
  Future<Response> editCenterDoctor({

    required int doctorId,
    required String name,
    required String price,
    required String phone,
    required String avatar,
    required String gender,
    required int jobTitleId,
    required List<int> specializationIds,
    required String notes,
  }) async {
    Response response;
    try {
      debugPrint("AddCenterDoctor name in repo$name");
      debugPrint("AddCenterDoctor phone in repo$phone");
      debugPrint("AddCenterDoctor avatar in repo$avatar");
      debugPrint("AddCenterDoctor gender in repo$gender");
      debugPrint("AddCenterDoctor jobTitle in repo$jobTitleId");
      debugPrint("AddCenterDoctor specializationIds in repo$specializationIds");
      debugPrint("AddCenterDoctor notes in repo$notes");
      response = await _networkService.post(
          url: uRLCenterEditDoctor,
          auth: true,
          body: {
            'doctor_id':doctorId,
            'name':name,
            'phone':phone,
            'image':avatar,
            'gender':gender,
            'price':price,

            'specializations':specializationIds,
            'job_title_id':jobTitleId,
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

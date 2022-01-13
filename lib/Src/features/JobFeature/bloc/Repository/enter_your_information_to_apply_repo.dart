

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';

class EnterYourInformationToApplyRepository with ApiKey {
  // GetStorage box = GetStorage();
  NetworkService _networkService = NetworkService();
  Future<Response> enterYourInformationToApply({
    required String name,
    required String phone,
    required String email,
    required int gender,
    required String university,
    required String graduationYear,
    required String universityDegree,
    required String graduationCertificateImage,
    required String cVImage,
    required List<int> specializationId,
  }) async {
    Response response;
    try {
      response = await _networkService.post(
          url: uRLEnterAndEditMyPersonalData,
          auth: true,
          body: {
            'owner_name':name,
            'phone':phone,
            'address':email,
            'seintific_level':gender,
            'specialization_ids':specializationId,
            'university':university,
            'graduation_year':graduationYear,
            'universityDegree':universityDegree,
            'description':graduationCertificateImage,
            'cVImage':cVImage,
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



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
    required String gender,
    required String university,
    required String graduationYear,
    required String universityDegree,
    required String graduationCertificateImage,
    required String cVImage,
    required List<int> specializationId,
  }) async {
    Response response;
    try {git
      response = await _networkService.post(
          url: uRLEnterInfoToApplyJob,
          auth: true,
          body: {
            'name':name,
            'phone':phone,
            'email':email,
            'gender':gender,
            'graduation_year':graduationYear,
            'universityDegree':universityDegree,
            'university_id':university,
            'specializations':specializationId,
            'certification_image':graduationCertificateImage,
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

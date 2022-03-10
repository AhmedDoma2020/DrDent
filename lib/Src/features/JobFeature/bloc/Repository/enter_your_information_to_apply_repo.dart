

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';

class EnterYourInformationToApplyRepository with ApiKey {
  // GetStorage box = GetStorage();
  NetworkService _networkService = NetworkService();
  Future<Response> enterYourInformationToApply({
    required int jobOfferId,
    required String name,
    required String phone,
    required String email,
    required String gender,
    required int universityId,
    required String graduationYear,
    required String universityDegree,
    required String graduationCertificateImage,
    required String cVImage,
    required List<int> specializationId,
  }) async {
    debugPrint("jobOfferId in repo is $jobOfferId");
    debugPrint("name in repo is $name");
    debugPrint("phone in repo is $phone");
    debugPrint("email in repo is $email");
    debugPrint("gender in repo is $gender");
    debugPrint("universityId in repo is $universityId");
    debugPrint("graduationYear in repo is $graduationYear");
    debugPrint("universityDegree in repo is $universityDegree");
    debugPrint("graduationCertificateImage in repo is $graduationCertificateImage");
    debugPrint("cVImage in repo is $cVImage");
    debugPrint("specializationId in repo is $specializationId");

    Response response;
    try {
      response = await _networkService.post(
          url: uRLEnterInfoToApplyJob,
          auth: true,
          body: {
            'job_offer_id':jobOfferId,
            'name':name,
            'phone':phone,
            'email':email,
            'gender':gender,
            'graduation_year':graduationYear,
            'university_degree':universityDegree,
            'university_id':universityId,
            'specializations':specializationId,
            'certification_image':graduationCertificateImage,
            'cv':cVImage,
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

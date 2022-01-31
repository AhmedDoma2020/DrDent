import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';

class EnterAndEditPersonalDataOfGraduatedRepository with ApiKey {
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> enterAndEditPersonalDataOfGraduated({
    required String avatar,
    required String name,
    required String gender,
    required int universityId,
    required String graduationYear,
    required String graduationDegree,
    required List<int> specializationId,
    required String graduationCertificate,
    required String cv,
  }) async {
    Response response;
    try {
      response = await _networkService.post(
          url: uRLEnterAndEditPersonalDataOfGraduated,
          auth: true,
          body: {
            'image':avatar,
            'name':name,
            'gender':gender,
            'university_id':universityId,
            'graduation_year':graduationYear,
            'graduation_degree':graduationDegree,
            'specializations':specializationId,
            'work_lisence':graduationCertificate,
            'cv':cv,
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

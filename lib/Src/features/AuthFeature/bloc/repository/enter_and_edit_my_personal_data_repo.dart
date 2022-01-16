import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';

class EnterAndEditMyPersonalDataRepository with ApiKey {
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> enterAndEditMyPersonalData({
    required String name,
    required String gender,
    required int scientificLevel,
    required List<int> specializationId,
    required String moreInfo,
    required String image,
  }) async {
    Response response;
    try {
      response = await _networkService.post(
        url: uRLEnterAndEditMyPersonalData,
          auth: true,
          body: {
            'name':name,
            'gender':gender,
            'seintific_level':scientificLevel,
            'specializations':specializationId,
            'about':moreInfo,
            'work_lisence':image,
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

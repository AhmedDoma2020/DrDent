import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';

class DetectionLocationDetailsRepository with ApiKey {
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> detectionLocationDetails({
    required String name,
    required String phone1,
    required String phone2,
    required String price,
    required String address,
    required double lat,
    required double lon,
    required int stateId,
    required int cityId,
    required String buildNumber,
    required String flatNumber,
    required String mark,
    required String image,
  }) async {
    Response response;
    try {
      response = await _networkService.post(
          url: uRLSetWorkSpace,
          auth: true,
          body: {
            'name':name,
            'phone':phone1,
            'mobile':phone2,
            'price':price,
            'address':address,
            'lat':lat,
            'lon':lon,
            'state_id':stateId,
            'city_id':cityId,
            'buliding_number':buildNumber,
            'flat_number':flatNumber,
            'mark':mark,
            'image':image,
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

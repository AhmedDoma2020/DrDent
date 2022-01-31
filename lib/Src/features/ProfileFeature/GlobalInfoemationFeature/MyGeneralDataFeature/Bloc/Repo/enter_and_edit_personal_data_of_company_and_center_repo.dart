import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';

class EnterAndEditPersonalDataOfCompanyAndCenterRepository with ApiKey {
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> enterAndEditPersonalDataOfCompanyAndCenter({
    required String avatar,
    required String name,
    required String administratorName,
    required String administratorPhone,
    required int stateId,
    required int cityId,
    required double lat,
    required double lon,
    required String address,
    required String taxNumber,
    required String logRecord,
    required String taxNumberImage,
    required String logRecordImage,
    required String moreInfo,
  }) async {
    Response response;
    try {
      response = await _networkService.post(
        url: uRLEnterAndEditPersonalDataOfCompanyAndCenter,
          auth: true,
          body: {
            'image':avatar,
            'name':name,
            'administrator_name':administratorPhone,
            'administrator_phone':administratorPhone,
            'state_id':stateId,
            'city_id':cityId,
            'lat':lat,
            'lon':lon,
            'address':address,
            'tax_number':taxNumber,
            'log_record':logRecord,
            'log_record_image':logRecordImage,
            'tax_number_image':taxNumberImage,
            'about':moreInfo,
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

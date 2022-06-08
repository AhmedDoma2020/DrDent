import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';

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
    required String buildNumber,
    required String flatNumber,
    required String mark,
    required String taxNumber,
    required String logRecord,
    required String taxNumberImage,
    required String logRecordImage,
    required String moreInfo,
  }) async {
    debugPrint("logRecord in repo $logRecord");
    debugPrint("stateId in repo $stateId");
    debugPrint("cityId in repo $cityId");
    debugPrint("lat in repo $lat");
    debugPrint("lon in repo $lon");
    debugPrint("address in repo $address");
    debugPrint("stateId in repo $stateId");
    Response response;
    try {
      response = await _networkService.post(
        url: uRLEnterAndEditPersonalDataOfCompanyAndCenter,
          auth: true,
          body: {
            'image':avatar,
            'name':name,
            'adminstrator_name':administratorName,
            'adminstrator_phone':administratorPhone,
            'state_id':stateId,
            'city_id':cityId,
            'lat':lat,
            'lon':lon,
            'address':address,
            'buliding_number':buildNumber,
            'flat_number':flatNumber,
            'mark':mark,
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

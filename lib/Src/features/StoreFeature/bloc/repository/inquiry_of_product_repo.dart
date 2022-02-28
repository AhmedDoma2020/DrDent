import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';

class InquiryOfProductRepository with ApiKey {
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();

  Future<Response> inquiryOfProduct({
    required String phone,
    required String name,
  }) async {
    Response response;
    try {
      response = await _networkService.post(
          url: '',
          auth: true,
          body: {
            'phone':phone,
            'name':name,
            // 'device_token':"",
            // 'device_id':deviceId,
            // 'device_type':deviceType,
          }
      );
    } on SocketException {
      throw const SocketException('No Internet Connection');
    } on Exception {
      throw UnKnownException('there is unKnown Exception');
    } catch (e) {
      throw UnKnownException(e.toString());
    }
    return response;
  }
}

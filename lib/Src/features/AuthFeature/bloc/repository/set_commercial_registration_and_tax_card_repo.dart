import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';

class SetCommercialRegistrationAndTaxCardRepository with ApiKey {
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> setCommercialRegistrationAndTaxCard({
    required String numOfCommercialRegistration,
    required String numOfTaxRegistration,
    required String imageOfCommercialRegistration,
    required String imageOfTaxRegistration,
  }) async {
    Response response;
    try {
      response = await _networkService.post(
          url: uRLSetCommercialRegistrationAndTaxCard,
          auth: true,
          body: {
            'tax_number':numOfTaxRegistration,
            'log_record':numOfCommercialRegistration,
            'log_record_image':imageOfCommercialRegistration,
            'tax_number_image':imageOfTaxRegistration,
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

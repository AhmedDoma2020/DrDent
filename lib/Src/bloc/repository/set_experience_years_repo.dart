import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';

class SetExperienceYearsRepository with ApiKey {
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> setExperienceYears({
    required String workYear,
  }) async {
    Response response;
    try {
      response = await _networkService.post(
          url: uRLSetExperienceYears,
          auth: true,
          body: {
            'work_year':workYear,
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

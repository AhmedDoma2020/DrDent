import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';

class ChangePasswordRepository with ApiKey {
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    Response response;
    try {
      response = await _networkService.post(
          url: uRLChangePassword,
          auth: true,
          body: {
            'old_password':oldPassword,
            'new_password':newPassword,
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

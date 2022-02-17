import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';

class AddCompanyProductRepository with ApiKey {
  final NetworkService _networkService = NetworkService();
  Future<Response> addCompanyProduct({
    required String title,
    required int categoryId,
    required String expireDate,
    required String text,
    required String usability,
    // required String generalUse,
    // required String sideEffects,
    required List<String> images,
  }) async {
    Response response;
    try {
      response = await _networkService.post(
          url: uRLCompanyAddProduct,
          auth: true,
          body: {
            'title':title,
            'category_id':categoryId,
            'expire_date':"2022-02-28",
            'text':text,
            'usability':usability,
            // 'general_use':generalUse,
            // 'side_effects':sideEffects,
            'images':images,
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

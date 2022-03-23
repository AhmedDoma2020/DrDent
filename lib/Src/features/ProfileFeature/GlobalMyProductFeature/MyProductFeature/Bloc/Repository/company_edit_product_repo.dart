import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';

class EditCompanyProductRepository with ApiKey {
  final NetworkService _networkService = NetworkService();
  Future<Response> editCompanyProduct({
    required String title,
    required int productId,
    required int categoryId,
    required String text,
    required String usability,
    required List<String> images,
  }) async {
    debugPrint("images in AddCompanyProductRepository is ${images.length}");
    Response response;
    try {
      response = await _networkService.post(
          url: uRLCompanyEditProduct,
          auth: true,
          body: {
            'product_id':productId,
            'title':title,
            'category_id':categoryId,
            'text':text,
            'usability':usability,
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

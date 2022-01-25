

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';

class AddPostRepository with ApiKey {
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> addPost({
    required String content,
    required List<String> images,
    required List<int> userTypeIds,
  }) async {
    Response response;
    try {
      response = await _networkService.post(
          url: uRLAddPost,
          auth: true,
          body: {
            'content':content,
            'images':images,
            'user_type_ids':userTypeIds,
            'tag_ids':[],
            'service_ids':[],
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

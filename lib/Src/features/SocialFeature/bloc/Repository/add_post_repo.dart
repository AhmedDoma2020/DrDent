

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';

class AddPostRepository with ApiKey {
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> addPost({
    required String content,
    required List<String> images,
    required List<int> tags,
  }) async {
    log("imagesList in repo is $images");
    log("tags in repo is $tags");
    Response response;
    try {
      response = await _networkService.post(
          url: uRLAddPost,
          auth: true,
          body: {
            'content':content,
            'images':images,
            'tag_ids':tags,
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

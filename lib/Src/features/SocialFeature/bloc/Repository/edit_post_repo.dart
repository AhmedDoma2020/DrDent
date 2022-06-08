

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';

class EditPostRepository with ApiKey {
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();
  Future<Response> editPost({
    required int postId,
    required String content,
    required List<String> images,
    required List<int> sharesId,
  }) async {
    log("imagesList in repo is $images");
    log("tags in repo is $sharesId");
    Response response;
    try {
      response = await _networkService.post(
          url: uRLEditPost,
          auth: true,
          body: {
            'post_id':postId,
            'content':content,
            if(images.isNotEmpty)'images':images,
            if(sharesId.isNotEmpty)'user_type_ids':sharesId,

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

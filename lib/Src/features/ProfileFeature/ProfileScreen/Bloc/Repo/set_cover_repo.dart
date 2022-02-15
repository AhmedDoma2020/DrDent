
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
class SetCoverRepository with ApiKey{
  final NetworkService _networkService = NetworkService();
  Future<Response> setCover({required String image})async{
    Response response;
    try{
      response = await _networkService.post(
        url:uRLSetCover,
        auth: true,
        body: {
          "cover":image,
        },
      );
    }on SocketException{
      throw const SocketException('No Internet Connection');
    }on Exception{
      throw UnKnownException('there is unKnown Exception');
    }catch (e){
      throw UnKnownException(e.toString());
    }
    return response;
  }
}

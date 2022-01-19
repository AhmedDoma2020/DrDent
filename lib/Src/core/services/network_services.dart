import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class NetworkService with ApiKey{
  Dio dio = Dio();
  GetStorage box = GetStorage();
  String apiTokenStatic ='\$2y\$10\$MAVyBbLcXlsRZ6Geb7c.8e/O9yYVhT0QuT//oMASxJGRDobz6e9em';
  Future<Response> get({@required String? url, Map<String , String>? headers,bool auth = false}) async {
    Response? response;
    String apiToken =box.read('apiToken')??"";
    log("log apiToken in netWork >>>>>>>>>:-> $apiToken");
    try {
      dio.options.baseUrl = ApiKey.apiBaseUrl;
      response = await dio.get(url!, options: Options(
          headers: headers??{
            'Accept-Language' : 'en',
            if(auth)
            // 'Authorization': 'Bearer ' + apiToken
              'Authorization': 'Bearer ' + apiTokenStatic
          }
      ));
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    } on SocketException{
      throw SocketException;
    } catch(e){
      throw SocketException;
    }
    return handleResponse(response!);
  }
  Future<Response> post({@required String? url,
    Map<String , String>? headers, Map<String , dynamic>? body,bool auth = false}) async {
    Response? response;
    String apiToken =box.read('apiToken')??"";
    print("apiToken in netWork >>>>>>>>>:-> $apiToken");
    dio.options.baseUrl = ApiKey.apiBaseUrl;
    try {
      response = await dio.post(
        url!,
        data: body,
        options: Options(
          headers: headers??{
            'Accept-Language' : 'en',
            if(auth)
            // 'Authorization': 'Bearer ' + apiToken
              'Authorization': 'Bearer ' + apiTokenStatic
          },
          // requestEncoder: encoding,
        ),
      );
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse(response!);
  }
  Response handleResponse(Response response) {
    final int statusCode = response.statusCode??500;
    if (statusCode >= 200 && statusCode < 300) {
      log("correct request: " + response.toString());
      return response;
    } else {
      log("correct request: " + response.toString());
      return response;
    }
  }
}
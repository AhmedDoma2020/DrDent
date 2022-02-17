import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class NetworkService with ApiKey{
  Dio dio = Dio();
  GetStorage box = GetStorage();
  Future<Response> get({@required String? url, Map<String , String>? headers,bool auth = false}) async {
    Response? response;
    String apiToken =box.read("api_token")??"Not Found Token";
    // $2y$10$UhxEg1C1eKZ9PTP7PpXJUeJmo0FdQCPNcIGkrcCQPBitzolgSUmbS
    String staticApiToken ="\$2y\$10\$UhxEg1C1eKZ9PTP7PpXJUeJmo0FdQCPNcIGkrcCQPBitzolgSUmbS";
    log("apiToken storage in netWork >>>>>>>>>:-> $apiToken");
    log("apiToken static in netWork >>>>>>>>>:-> $staticApiToken");
    try {
      dio.options.baseUrl = ApiKey.apiBaseUrl;
      response = await dio.get(url!, options: Options(
          headers: headers??{
            'Accept-Language' : 'en',
            if(auth)
            'Authorization': 'Bearer ' + apiToken
              // 'Authorization': 'Bearer ' + staticApiToken
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
    String apiToken =box.read("api_token")??"Not Found Token";
    // $2y$10$UhxEg1C1eKZ9PTP7PpXJUeJmo0FdQCPNcIGkrcCQPBitzolgSUmbS
    String staticApiToken ="\$2y\$10\$UhxEg1C1eKZ9PTP7PpXJUeJmo0FdQCPNcIGkrcCQPBitzolgSUmbS";
    log("apiToken storage in netWork >>>>>>>>>:-> $apiToken");
    log("apiToken static in netWork >>>>>>>>>:-> $staticApiToken");
    dio.options.baseUrl = ApiKey.apiBaseUrl;
    try {
      response = await dio.post(
        url!,
        data: body,
        options: Options(
          headers: headers??{
            'Accept-Language' : 'en',
            if(auth)
            'Authorization': 'Bearer ' + apiToken
              // 'Authorization': 'Bearer ' + staticApiToken
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
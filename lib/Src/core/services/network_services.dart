import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class NetworkService with ApiKey {
  // Dio dio = Dio();
  Dio dio = Dio();
  GetStorage box = GetStorage();

  String getToken() {
    // log("log api_token in NetworkService>:- ${box.read('api_token') ?? ''}");
    return box.read('api_token') ?? '\$2y\$10\$bbinB.LCKjHfLTaLp5zBg.vZYpIsxtz5b5o6e72v.ZUTyVJ0D57qi';
  }

  // final String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWM1NjQ1YTNjYTI5MjVkN2I1NmM2NTMzZDM3YmJlNDI5ZGE1MGIzOTA0NzViOTNmZmJmMzZjZWI5ZTgyMGZhNTEyYTBkYzllYzI0YTQ0MjgiLCJpYXQiOjE2MzU0MzA2MjYuMzkwNzE4LCJuYmYiOjE2MzU0MzA2MjYuMzkwNzIyLCJleHAiOjE2NjY5NjY2MjYuMzg2ODczLCJzdWIiOiI1Iiwic2NvcGVzIjpbImN1c3RvbWVyIl19.znLN8V_PrPP6EAiVa1Yg3IkUBtURRzAdRYJr9QVwiF1PmGpAAZOWBWtHwKHGI7RC3zr0luKn9sExotfTGPx1m2sS9M76fGEuVpf-7zMbA_B8kdiuRJjy2IbONORNM_ElLiQrL7EUu3Na0gW5QikvGYgTVU3PzqENCIXEMunupVPu9RGq6WTbFOVfMjCrvh9IN6NJ6PLcHH9gpu6lxJDuBS28V2mM0pRQyArWgLWdwC_X7nLTK5gy8QhH5_6kwwRO_6qIl64q63GBa96HnXXQZG-QKeICvV8-vXDkImys1fQMgLiuw03x7-42_lGenzp7i8u-hMdVjglaykU7CE0utpjqAkzz-xpXCQMa5M_oE8hZFYSJjajJ5amG-Tz5oqyTvARuqy1pzVTG5HGV5iPMaUcTDSUl7-WVTMdXOXVmE3Dvikh9zF47Q7to9ykFNO9f0uM7aIQUh0ZPJKQ526uTZqP0YVtUvJ60jt-j0TNgOVrShSYRb_FGZTQ0NwxsHLctOl0Kiy2Oodxj-rpbIxH0udP0TR1y6UIUoJEmxVBQzKV2eqtyZJv3A2EnlDOHTBWQJJXERQWGA28yd4sJhY0ZNIPlf7az5t6oVjPf9-lH6vqTaiY1PW6VWAwbNmYeyZJ3TKV0UbKA5xVk5jfcxOjK6tLFB_BS0e1BoBrQ-SN05ks';
  Future<Response> get(
      {@required String? url,
      Map<String, String>? headers,
      bool auth = false}) async {
    print("The Token is $getToken");
    Response? response;
    try {
      dio.options.baseUrl = ApiKey.apiBaseUrl;
      response = await dio.get(url!,
          options: Options(
              headers: headers ??
                  {
                    'Accept-Language': '${box.read("lan") ?? "ar"}',
                    if (auth)
                      // if(box.hasData('api_token') || box.hasData('alternativeـapi_token'))
                      //   'Authorization': 'Bearer ' + box.read('api_token')??box.read('alternativeـapi_token')??' ',
                      'Authorization': 'Bearer ' + getToken(),
                  }));
  // String getMyToken(){
  //   return box.read('token')??box.read('alternativeـapi_token')??' ';
  // }
  String apiTokenStatic ='\$2y\$10\$6h.z4vTtNELt6YNbPU/PyOcf.lidMigfjiv4jNDyk70V0WypzaHFO';
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
    } on SocketException {
      throw SocketException;
    } catch (e) {
      throw SocketException;
    }
    return handleResponse(response!);
  }

  Future<Response> post(
      {@required String? url,
      Map<String, String>? headers,
      Map<String, dynamic>? body,
      bool auth = false}) async {

  Future<Response> post({@required String? url,
    Map<String , String>? headers, Map<String , dynamic>? body,bool auth = false}) async {
    Response? response;
    dio.options.baseUrl = ApiKey.apiBaseUrl;
    print("The Token is $getToken");
    try {
      response = await dio.post(
        url!,
        data: body,
        options: Options(
          headers: headers ??
              {
                'Accept-Language': '${box.read("lan") ?? "ar"}',
                if (auth) 'Authorization': 'Bearer ' + getToken(),
              },
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
    final int statusCode = response.statusCode ?? 500;
    if (statusCode >= 200 && statusCode < 300) {
      log("correct request: " + response.toString());
      return response;
    } else {
      log("correct request: " + response.toString());
      return response;
    }
  }
}

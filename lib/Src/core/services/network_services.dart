import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';



class NetworkService with ApiKey{
  Dio dio = Dio();
  GetStorage box = GetStorage();

  // String getMyToken(){
  //   return box.read('token')??box.read('alternativeـapi_token')??' ';
  // }

  Future<Response> get({@required String? url, Map<String , String>? headers,bool auth = false}) async {
    Response? response;
    String apiToken =box.read('apiToken')??"";
    // String apiTokenStatic ="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMGEwOGVkNzFkOTRlODczYzBjYjhmYTdlZmQyMDk5ZTAzZDZiNGZmMDEyZDQ2NDBjNjZjN2FhZTFlM2VjNmUwZjI1NDBmMzYxZjc3M2IxYzciLCJpYXQiOjE2Mzc2NTY3ODQuNDMxNzc4LCJuYmYiOjE2Mzc2NTY3ODQuNDMxNzg5LCJleHAiOjE2NjkxOTI3ODQuNDIwMzg3LCJzdWIiOiIxOSIsInNjb3BlcyI6WyJzaG9wcyJdfQ.uNG5jsWdF0JG1H2A3eMRsVEGFmCV-kzIxG6H_ovRHI85f0pFKGoC58bA5my_MiNgiQznHRwhdsvpCc0XPRcDNr3f8hGuRQT-zraKUbn7CMXE2y_JOiH-4PQRpIT0J1A6RkAKMuwcWRx8NePgpBC_sxYsm95O91CZZNS7Cs5OvYJIaeaXYfv7kMBSt5hrbyXDUQBmwHJdd90Dtr-LwFK0ZnYeDwbquTNwhC3oJHj4KA1Zi2u8mDBB2M6UrujiOjpirzUeo3DuYDEHOdNWw2rFKu0bY9t0A7iM6ZZWbZdjPG-abell9eMAeNjbZ6DjbZAJJChAZLQwyGTaoOuV-cqxp2AHSCiTYlgCnDExkwTNxoVvXOLfD3JOGuovyYc8sSZ90K6JLMrX64YE3OstWDS-DrSQgMq1wzHqKpiyjHrMR9GscPPOfogP013_cwUFs7rsq5HqGs2nN_FjILpiAMLhU_EELzcdChgODn5vGFQupmQPoBK6uTYtZP_BQHreR5T9ebOeaui95jQGorfJjueXG5mSudjNrytIVh6k1Q8Pks9TqIGksM7rw44r-5p7jqPX5CZ2I7wOdRcNcK16YeMi3cyvrWymneQj5SbadxD4sF3Bl1DLcKxH7Evb-rGPXnrhnBvzvQGkRRRHaBnI8jidsp2iwC8jbCRmbnWhcY6VSL4";
    log("log apiToken in netWork >>>>>>>>>:-> $apiToken");
    try {
      dio.options.baseUrl = ApiKey.apiBaseUrl;
      response = await dio.get(url!, options: Options(
          headers: headers??{
            'Accept-Language' : 'en',
            if(auth) 'Authorization': 'Bearer ' + apiToken
            // 'Authorization': 'Bearer ' + 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZjUxNjYzYmQ0Yjk3YzQ4OGU2N2Q4NjU5ZjY3NWY0M2VhY2ZiZTNkMGIwNjE2ZDBkNmE4MmFjMTAzNDU4ZjFlNjE2NjEwYmZlOTlmMDA4NjkiLCJpYXQiOjE2MzU5MzY0NzQuMTUwMjE3LCJuYmYiOjE2MzU5MzY0NzQuMTUwMjIyLCJleHAiOjE2Njc0NzI0NzQuMTQ2ODA3LCJzdWIiOiI5Iiwic2NvcGVzIjpbInNob3BzIl19.uAPkQu4eAxVQMbOs8xOSPOOOJnwE8hZlJth2fU3ziK9mgrfSgRRRRkJraHEgmlYdpUeqrRf6DjAi5mXxi8s4Q3MIvCsWCErRKOJAFrBvL5CVszQ4YV0yjbrAHjHunohen3s5JPpO-KkAlSBjU8BJr1Kp9L0jTvo7l8RZpaGoWmeFg2ahrs5CvcO82tpqhTeuoHCa8lFd8W8Uqn8xOoVRvm-xPr5TSOQtGWZ0AlP41YsygubxDsp1I2qJmUtMX1QBONt4l2Wc3CORy0AbExKLs4hYsuHDr5tNpRwDhUxwwnktdPUcwfcys7BoZ_oTkI0GhJlAWOWrHvVgxOw69gVh-Qt2-k4R1WdWpwxu6LoFkGGbnDfuPX_5RG0TP7lBssh0dKRrcIiIJB8iZ_zyoPhuZV4wcJ9Eql7AkP7K5UWz6kEuBNqrN5wOZKWnN0-SpEN7DjuavYZY0mHyOp3f0gWsXjqxrXh9w_m7Ny0Dm4lkZW79Arc5NyECfgCDsC5cMC3d5NZtw6oPWgatmB-oYiyeFjsiU0F-QdoxpIC2kL8AJUynK8jMDyy3d9Jp1q6-NLptMzBDnZybo3rY4Eg079J1xQW2SVxC3n_vSArHsgwKIPIVgQZ8JRrJXFSATAq717koCPQAMYzGHzoj84YJ_wP_aT63bWTzETdgTHodhIcwzZg'
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
    // String apiTokenStatic ="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMGEwOGVkNzFkOTRlODczYzBjYjhmYTdlZmQyMDk5ZTAzZDZiNGZmMDEyZDQ2NDBjNjZjN2FhZTFlM2VjNmUwZjI1NDBmMzYxZjc3M2IxYzciLCJpYXQiOjE2Mzc2NTY3ODQuNDMxNzc4LCJuYmYiOjE2Mzc2NTY3ODQuNDMxNzg5LCJleHAiOjE2NjkxOTI3ODQuNDIwMzg3LCJzdWIiOiIxOSIsInNjb3BlcyI6WyJzaG9wcyJdfQ.uNG5jsWdF0JG1H2A3eMRsVEGFmCV-kzIxG6H_ovRHI85f0pFKGoC58bA5my_MiNgiQznHRwhdsvpCc0XPRcDNr3f8hGuRQT-zraKUbn7CMXE2y_JOiH-4PQRpIT0J1A6RkAKMuwcWRx8NePgpBC_sxYsm95O91CZZNS7Cs5OvYJIaeaXYfv7kMBSt5hrbyXDUQBmwHJdd90Dtr-LwFK0ZnYeDwbquTNwhC3oJHj4KA1Zi2u8mDBB2M6UrujiOjpirzUeo3DuYDEHOdNWw2rFKu0bY9t0A7iM6ZZWbZdjPG-abell9eMAeNjbZ6DjbZAJJChAZLQwyGTaoOuV-cqxp2AHSCiTYlgCnDExkwTNxoVvXOLfD3JOGuovyYc8sSZ90K6JLMrX64YE3OstWDS-DrSQgMq1wzHqKpiyjHrMR9GscPPOfogP013_cwUFs7rsq5HqGs2nN_FjILpiAMLhU_EELzcdChgODn5vGFQupmQPoBK6uTYtZP_BQHreR5T9ebOeaui95jQGorfJjueXG5mSudjNrytIVh6k1Q8Pks9TqIGksM7rw44r-5p7jqPX5CZ2I7wOdRcNcK16YeMi3cyvrWymneQj5SbadxD4sF3Bl1DLcKxH7Evb-rGPXnrhnBvzvQGkRRRHaBnI8jidsp2iwC8jbCRmbnWhcY6VSL4";
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
            if(auth) 'Authorization': 'Bearer ' + apiToken
            // 'Authorization': 'Bearer ' + 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZjUxNjYzYmQ0Yjk3YzQ4OGU2N2Q4NjU5ZjY3NWY0M2VhY2ZiZTNkMGIwNjE2ZDBkNmE4MmFjMTAzNDU4ZjFlNjE2NjEwYmZlOTlmMDA4NjkiLCJpYXQiOjE2MzU5MzY0NzQuMTUwMjE3LCJuYmYiOjE2MzU5MzY0NzQuMTUwMjIyLCJleHAiOjE2Njc0NzI0NzQuMTQ2ODA3LCJzdWIiOiI5Iiwic2NvcGVzIjpbInNob3BzIl19.uAPkQu4eAxVQMbOs8xOSPOOOJnwE8hZlJth2fU3ziK9mgrfSgRRRRkJraHEgmlYdpUeqrRf6DjAi5mXxi8s4Q3MIvCsWCErRKOJAFrBvL5CVszQ4YV0yjbrAHjHunohen3s5JPpO-KkAlSBjU8BJr1Kp9L0jTvo7l8RZpaGoWmeFg2ahrs5CvcO82tpqhTeuoHCa8lFd8W8Uqn8xOoVRvm-xPr5TSOQtGWZ0AlP41YsygubxDsp1I2qJmUtMX1QBONt4l2Wc3CORy0AbExKLs4hYsuHDr5tNpRwDhUxwwnktdPUcwfcys7BoZ_oTkI0GhJlAWOWrHvVgxOw69gVh-Qt2-k4R1WdWpwxu6LoFkGGbnDfuPX_5RG0TP7lBssh0dKRrcIiIJB8iZ_zyoPhuZV4wcJ9Eql7AkP7K5UWz6kEuBNqrN5wOZKWnN0-SpEN7DjuavYZY0mHyOp3f0gWsXjqxrXh9w_m7Ny0Dm4lkZW79Arc5NyECfgCDsC5cMC3d5NZtw6oPWgatmB-oYiyeFjsiU0F-QdoxpIC2kL8AJUynK8jMDyy3d9Jp1q6-NLptMzBDnZybo3rY4Eg079J1xQW2SVxC3n_vSArHsgwKIPIVgQZ8JRrJXFSATAq717koCPQAMYzGHzoj84YJ_wP_aT63bWTzETdgTHodhIcwzZg'
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
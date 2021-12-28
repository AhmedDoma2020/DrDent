import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
class SetAssistantRepository with ApiKey{
  final NetworkService _networkService = NetworkService();
  Future<Response> setAssistant({required String name,required String phone,})async{
    Response response;
    print("name :> $name");
    print("phone :> $phone");
    try{
      response = await _networkService.post(
        url:uRLSetInsurance,
        auth: true,
        body: {
          "name": name,
          "phone": phone,
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

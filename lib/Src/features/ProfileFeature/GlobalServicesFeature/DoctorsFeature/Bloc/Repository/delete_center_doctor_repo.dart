import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
class DeleteCenterDoctorRepository with ApiKey{
  final NetworkService _networkService = NetworkService();
  Future<Response> deleteCenterDoctor({required int doctorId})async{
    Response response;
    try{
      response = await _networkService.post(
        url:uRLDeleteCenterDoctor,
        auth: true,
        body: {
          "doctor_id": doctorId,
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

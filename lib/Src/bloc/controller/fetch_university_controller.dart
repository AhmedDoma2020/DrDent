import 'package:dr_dent/Src/bloc/model/univeristy_model.dart';
import 'package:dr_dent/Src/bloc/repository/fetch_university_repo.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FetchUniversityController extends GetxController {
  final List<ChoiceModel> _universityList = [];
  List<ChoiceModel> get universityList => _universityList;

  // void changeSelectServices({ required int servicesIndex}){
  //   _ServicesList[servicesIndex].active = !_ServicesList[servicesIndex].active;
  //   update();
  // }

  int _universitySIndex = -1;
  int get universitySIndex => _universitySIndex;
  void changeSIndex(value) {
    _universitySIndex = value;
    update();
  }

  RequestStatus status = RequestStatus.initial;
  final FetchUniversityRepository _fetchUniversityRepository = FetchUniversityRepository();
  Future<void> fetchUniversity() async {
    status = RequestStatus.loading;
    var response = await _fetchUniversityRepository.fetchUniversity();
    status = RequestStatus.done;
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _universityList.clear();
      for (var item in response.data['data']) {
        _universityList.add(ChoiceModel.fromJson(item));
      }
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    } else {
      status = RequestStatus.error;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchUniversity();
    debugPrint("_universitySIndex $_universitySIndex");
  }
}

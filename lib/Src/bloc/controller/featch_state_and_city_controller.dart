
import 'package:dr_dent/Src/bloc/model/state_and_city_model.dart';
import 'package:dr_dent/Src/bloc/repository/fetch_state_repo.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class FetchStateAndCityController extends GetxController {
  List<StateAndCityModel> _stateAndCityList = [];
  List<StateAndCityModel> get stateAndCityList => _stateAndCityList;
  TextEditingController? stateController;
  TextEditingController? cityController;


  int _stateIndexSelected= -1;
  int get stateIndexSelected => _stateIndexSelected;
  set setStateIndexSelected(int value) {
    _stateIndexSelected = value;
  }


  int _stateIndex = -1;
  int get stateIndex => _stateIndex;
  void changeStateIndex(value) {
    _stateIndex = value;
    update();
  }

  int _cityIndex = -1;
  int get cityIndex => _cityIndex;
  void changeCityIndex(value) {
    _cityIndex = value;
    update();
  }

  int _stateIdSelected =-1;
  int get stateIdSelected => _stateIdSelected;
  set setStateIdSelected(int value) {
    _stateIdSelected = value;
  }

  int _cityIdSelected =-1;
  int get cityIdSelected => _cityIdSelected;
  set setCityIdSelected(int value) {
    _cityIdSelected = value;
  }

  RequestStatus status = RequestStatus.initial;
  final FetchStateAndCityRepository _fetchStateRepository = FetchStateAndCityRepository();
  Future<void> fetchStateAndCity() async {
    var response = await _fetchStateRepository.fetchStateAndCity();
    if (response.statusCode == 200 && response.data["status"] == true) {
      print("request operation success");
      _stateAndCityList.clear();
      for (var item in response.data['data']) {
        _stateAndCityList.add(StateAndCityModel.fromJson(item));
      }
      print("convert operation success");
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
    fetchStateAndCity();
    stateController = TextEditingController();
    cityController = TextEditingController();
  }
  @override
  void dispose() {
    stateController?.dispose();
    cityController?.dispose();
    super.dispose();
  }


}

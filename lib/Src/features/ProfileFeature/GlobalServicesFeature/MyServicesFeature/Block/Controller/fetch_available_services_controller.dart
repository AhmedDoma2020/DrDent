import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/bloc/model/service_model.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/fetch_available_insurances_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/fetch_available_services_repo.dart';
import 'package:get/get.dart';

class FetchAvailableServicesController extends GetxController {
  List<ServiceModel> _servicesList = [];
  List<ServiceModel> get servicesList => _servicesList;

  // void changeSelectServices({ required int servicesIndex}){
  //   _ServicesList[servicesIndex].active = !_ServicesList[servicesIndex].active;
  //   update();
  // }
  int _daySIndex = -1;
  int get daySIndex => _daySIndex;
  void changeSIndex(value) {
    _daySIndex = value;
    update();
  }

  RequestStatus status = RequestStatus.initial;
  final FetchAvailableServicesRepository _etchAvailableServicesRepository = FetchAvailableServicesRepository();
  Future<void> fetchAvailableServices() async {
    _servicesList = [...myServiceModelExample];
    update();
    // var response =
    //     await _etchAvailableServicesRepository.fetchAvailableServices();
    // if (response.statusCode == 200 && response.data["status"] == true) {
    //   print("request operation success");
    //   _ServicesList.clear();
    //   for (var item in response.data['waitingOrder']) {
    //     _ServicesList.add(ServiceModel.fromJson(item));
    //   }
    //   print("convert operation success");
    //   status = RequestStatus.done;
    //   update();
    // } else {
    //   status = RequestStatus.error;
    //   update();
    // }
  }

  @override
  void onInit() {
    super.onInit();
    fetchAvailableServices();
  }
}

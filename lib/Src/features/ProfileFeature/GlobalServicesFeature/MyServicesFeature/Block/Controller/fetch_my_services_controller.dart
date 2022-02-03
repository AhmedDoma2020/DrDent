import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/bloc/model/service_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/delete_insurance_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/fetch_my_insurances_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/delete_services_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/fetch_my_services_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FetchMyServicesController extends GetxController {
  List<ServiceModel> _myServicesList = [];
  List<ServiceModel> get myServicesList => _myServicesList;


  RequestStatus status = RequestStatus.initial;
  void changeSelectServices({ required int servicesIndex}){
    _myServicesList[servicesIndex].selected = !_myServicesList[servicesIndex].selected;
    update();
  }

  final FetchMyServicesRepository _fetchMyServicesRepository = FetchMyServicesRepository();
  final DeleteServicesRepository _deleteServicesRepository =   DeleteServicesRepository();
  Future<void> fetchMyServices() async {
    // _myServicesList = [...myServiceModelExample];
    // update();
    status = RequestStatus.loading;
    var response = await _fetchMyServicesRepository.fetchMyServices();
    status = RequestStatus.done;
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success in my services");
      _myServicesList.clear();
      for (var item in response.data['data']) {
        _myServicesList.add(ServiceModel.fromJson(item));
      }
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    } else {
      status = RequestStatus.error;
      update();
    }
  }

  Future<void> deleteInsurances({required int servicesId, required int index}) async {
    setLoading();
    var response = await _deleteServicesRepository.deleteServices(servicesId:  servicesId);
    Get.back();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      fetchMyServices();
      debugPrint("convert operation success");
      status = RequestStatus.done;
      customSnackBar(title: response.data["message"]??"Error");
      update();
    } else {
      status = RequestStatus.error;
      customSnackBar(title: response.data["message"]??"Error");
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchMyServices();
  }
}

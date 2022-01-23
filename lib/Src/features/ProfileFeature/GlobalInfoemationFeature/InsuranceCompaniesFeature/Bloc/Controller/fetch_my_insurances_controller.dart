import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/delete_insurance_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/fetch_my_insurances_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FetchMyInsurancesController extends GetxController {
  List<InsuranceModel> _myInsuranceList = [];
  List<InsuranceModel> get myInsuranceList => _myInsuranceList;

  RequestStatus status = RequestStatus.initial;
  final FetchMyInsurancesRepository _fetchMyInsurancesRepository = FetchMyInsurancesRepository();
  final DeleteInsurancesRepository _deleteInsurancesRepository = DeleteInsurancesRepository();

  Future<void> fetchMyInsurances() async {
status = RequestStatus.loading;
    var response = await _fetchMyInsurancesRepository.fetchMyInsurances();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _myInsuranceList.clear();
      for (var item in response.data['data']) {
        _myInsuranceList.add(InsuranceModel.fromJson(item));
      }
      debugPrint("convert operation success");
      debugPrint("response.data is ${response.data}");

      status = RequestStatus.done;
      update();
    } else {
      status = RequestStatus.error;
      debugPrint("response.data is ${response.data}");
      update();
    }
  }

  Future<void> deleteInsurances({required int insuranceId , required int index}) async {
    // _myInsuranceList.removeAt(index);
    setLoading();
    var response = await _deleteInsurancesRepository.deleteInsurances(insuranceId: insuranceId);
    Get.back();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      // _myInsuranceList.removeAt(index);
      fetchMyInsurances();
      customSnackBar(title: response.data["message"]??"Error");
      debugPrint("convert operation success");
      status = RequestStatus.done;
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
    fetchMyInsurances();
  }
}

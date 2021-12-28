import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/fetch_available_insurances_repo.dart';
import 'package:get/get.dart';

class FetchAvailableInsurancesController extends GetxController {
  List<InsuranceModel> _insuranceList = [];
  List<InsuranceModel> get insuranceList => _insuranceList;
  List<int> _insurancesIdList = [];
  List<int> get insurancesIdList => _insurancesIdList;
  void changeSelectInsurance({ required int insuranceIndex}){
    _insuranceList[insuranceIndex].active = !_insuranceList[insuranceIndex].active;
    update();
  }

  RequestStatus status = RequestStatus.initial;
  final FetchAvailableInsurancesRepository _etchAvailableInsurancesRepository = FetchAvailableInsurancesRepository();
  Future<void> fetchAvailableInsurances() async {
    _insuranceList = [...insuranceListExamples];
    update();
    // var response =
    //     await _etchAvailableInsurancesRepository.fetchAvailableInsurances();
    // if (response.statusCode == 200 && response.data["status"] == true) {
    //   // print("request operation success");
    //   // _insuranceList.clear();
    //   // for (var item in response.data['waitingOrder']) {
    //   //   _insuranceList.add(InsuranceModel.fromJson(item));
    //   // }
    //   // print("convert operation success");
    //   // status = RequestStatus.done;
    //   // update();
    // } else {
    //   status = RequestStatus.error;
    //   update();
    // }
  }

  @override
  void onInit() {
    super.onInit();
    fetchAvailableInsurances();
    _insurancesIdList=[];
  }
}

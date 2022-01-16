import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Controller/fetch_my_insurances_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/set_insurance_repo.dart';

import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:get/get.dart';

class SetInsurancesController extends GetxController {
  RequestStatus status = RequestStatus.initial;
  final SetInsurancesRepository _setInsurancesRepository =
  SetInsurancesRepository();
  final FetchMyInsurancesController _fetchMyInsurancesController = Get.put(FetchMyInsurancesController());
  Future<void> setInsurances({required List<int> insuranceId }) async {
    print("insuranceId $insuranceId");
    setLoading();
    var response = await _setInsurancesRepository.setInsurances(insuranceId: insuranceId);
    Get.back();
    if (response.statusCode == 200 && response.data["status"] == true) {
      print("request operation success");
      Get.back();
      customSnackBar(title: response.data["message"]??"Done");
      _fetchMyInsurancesController.fetchMyInsurances();
      print("convert operation success");
      status = RequestStatus.done;
      update();
    } else {
      status = RequestStatus.error;
      customSnackBar(title: response.data["message"]??"Error");
      update();
    }
  }
}

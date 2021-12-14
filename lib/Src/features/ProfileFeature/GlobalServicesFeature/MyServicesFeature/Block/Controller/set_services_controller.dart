import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/set_insurance_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/set_services_repo.dart';

import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:get/get.dart';

class SetServicesController extends GetxController {
  RequestStatus status = RequestStatus.initial;
  final SetServicesRepository _setServicesRepository =
  SetServicesRepository();
  Future<void> setServices({required String servicePrice,required int serviceId,required String serviceTime,}) async {
    update();
    setLoading();
    var response = await _setServicesRepository.setServices(servicePrice: servicePrice, serviceId: serviceId, serviceTime: serviceTime);
    Get.back();
    if (response.statusCode == 200 && response.data["status"] == true) {
      print("request operation success");
      customSnackBar(title: response.data["message"]??"Done");

      print("convert operation success");
      status = RequestStatus.done;
      update();
      customSnackBar(title: "delete_success".tr);
    } else {
      status = RequestStatus.error;
      customSnackBar(title: response.data["message"]??"Error");
      update();
    }
  }
}

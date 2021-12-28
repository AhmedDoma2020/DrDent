import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/set_insurance_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/set_services_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SetServicesController extends GetxController {

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController? servicesTypeSelectedController= TextEditingController();
  TextEditingController? servicesDurationController= TextEditingController();
  TextEditingController? servicesCostController= TextEditingController();
  int? _servicesId;
  int? get servicesId => _servicesId;
  set setServicesId(int value) {
    _servicesId = value;
  }

  RequestStatus status = RequestStatus.initial;
  final SetServicesRepository _setServicesRepository =
  SetServicesRepository();
  Future<void> setServices() async {
    if(globalKey.currentState!.validate()){
      globalKey.currentState!.save();
      Get.back();
      // setLoading();
      // var response = await _setServicesRepository.setServices(servicePrice: servicesCostController!.text, serviceId: _servicesId!, serviceTime: servicesDurationController!.text);
      // Get.back();
      // if (response.statusCode == 200 && response.data["status"] == true) {
      //   print("request operation success");
      //   customSnackBar(title: response.data["message"]??"Done");
      //   print("convert operation success");
      //   status = RequestStatus.done;
      //   update();
      //   customSnackBar(title: "delete_success".tr);
      // } else {
      //   status = RequestStatus.error;
      //   customSnackBar(title: response.data["message"]??"Error");
      //   update();
      // }
}

  }
  @override
  void onInit() {
    super.onInit();
    servicesTypeSelectedController = TextEditingController();
    servicesDurationController = TextEditingController();
    servicesCostController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    servicesTypeSelectedController?.dispose();
    servicesDurationController?.dispose();
    servicesCostController?.dispose();
  }
}

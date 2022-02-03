import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Controller/fetch_my_services_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/set_services_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SetServicesController extends GetxController {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController? servicesTypeSelectedController = TextEditingController();
  TextEditingController? workSpaceSelectedController = TextEditingController();
  TextEditingController? servicesDurationController = TextEditingController();
  TextEditingController? servicesCostController = TextEditingController();
  int? _servicesId;
  int? get servicesId => _servicesId;
  set setServicesId(int value) {
    _servicesId = value;
  }
  int? _workSpaceId;
  int? get workSpaceId => _workSpaceId;
  set setWorkSpaceId(int value) {
    _workSpaceId = value;
  }
  RequestStatus status = RequestStatus.initial;
  final FetchMyServicesController _fetchMyServicesController =Get.put(FetchMyServicesController());
  final SetServicesRepository _setServicesRepository = SetServicesRepository();
  Future<void> setServices() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      setLoading();
      var response = await _setServicesRepository.setServices(
        servicePrice: servicesCostController!.text,
        serviceId: _servicesId!,
        serviceTime: servicesDurationController!.text,
      );
      Get.back();
      Get.back();
      if (response.statusCode == 200 && response.data["status"] == true) {
        debugPrint("request operation success");
        customSnackBar(title: response.data["message"] ?? "Done");
        debugPrint("convert operation success");
        _fetchMyServicesController.fetchMyServices();
        status = RequestStatus.done;
        update();
      } else {
        status = RequestStatus.error;
        customSnackBar(title: response.data["message"] ?? "Error");
        update();
      }
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

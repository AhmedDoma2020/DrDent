import 'package:dr_dent/Src/bloc/model/assitant_model.dart';
import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/set_insurance_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/AddAssistantDataFeature/Bloc/Repo/set_assistant_data_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/set_services_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'fetch_my_assistant_controller.dart';

class SetAssistantController extends GetxController {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController? nameController= TextEditingController();
  TextEditingController? phoneController= TextEditingController();
  RequestStatus status = RequestStatus.initial;
final FetchMyAssistantController _fetchMyAssistantController = Get.put(FetchMyAssistantController());
  final SetAssistantRepository _setAssistantRepository = SetAssistantRepository();
  Future<void> setAssistant() async {
    if(globalKey.currentState!.validate()){
      globalKey.currentState!.save();
      AssistantModel newAssistant =  AssistantModel(name:nameController!.text,phone:phoneController!.text,id: 0,);
      _fetchMyAssistantController.addAssistantLocal(newAssistant);
      update();
      Get.back();
      // setLoading();
      // var response = await _setAssistantRepository.setAssistant(name: nameController!.text, phone: phoneController!.text);
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
    nameController = TextEditingController();
    phoneController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController?.dispose();
    phoneController?.dispose();
  }
}

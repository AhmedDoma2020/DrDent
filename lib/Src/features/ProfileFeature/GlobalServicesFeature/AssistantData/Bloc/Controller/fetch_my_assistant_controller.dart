import 'package:dr_dent/Src/bloc/model/assitant_model.dart';
import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/bloc/model/service_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/delete_insurance_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/fetch_my_insurances_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/AssistantData/Bloc/Repo/delete_assistant_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/delete_services_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/fetch_my_services_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:get/get.dart';

class FetchMyAssistantController extends GetxController {
  List<AssistantModel> _myAssistantList = [];
  List<AssistantModel> get myAssistantList => _myAssistantList;
  RequestStatus status = RequestStatus.initial;
  void addAssistantLocal(AssistantModel newAssistant){
    myAssistantList.insert(0, newAssistant);
    update();
  }
  final FetchMyServicesRepository _fetchMyServicesRepository = FetchMyServicesRepository();
  Future<void> fetchMyAssistant() async {
    _myAssistantList = [...myAssistantExample];
    update();
    // var response = await _fetchMyServicesRepository.fetchMyServices();
    // if (response.statusCode == 200 && response.data["status"] == true) {
    //   print("request operation success");
    //   _myAssistantList.clear();
    //   for (var item in response.data['waitingOrder']) {
    //     _myAssistantList.add(AssistantModel.fromJson(item));
    //   }
    //   print("convert operation success");
    //   status = RequestStatus.done;
    //   update();
    // } else {
    //   status = RequestStatus.error;
    //   update();
    // }
  }


  final DeleteAssistantRepository _deleteAssistantRepository =
  DeleteAssistantRepository();
  Future<void> deleteAssistant({required int assistantId, required int index}) async {
    _myAssistantList.removeAt(index);
    update();
    // setLoading();
    // var response = await _deleteAssistantRepository.deleteAssistant(assistantId:  assistantId);
    // Get.back();
    // if (response.statusCode == 200 && response.data["status"] == true) {
    //   print("request operation success");
    //   _myAssistantList.removeAt(index);
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

  @override
  void onInit() {
    super.onInit();
    fetchMyAssistant();
  }
}

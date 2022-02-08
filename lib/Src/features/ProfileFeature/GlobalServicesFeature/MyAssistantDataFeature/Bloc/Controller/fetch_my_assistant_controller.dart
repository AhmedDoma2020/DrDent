import 'package:dr_dent/Src/bloc/model/assitant_model.dart';
import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/bloc/model/service_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/delete_insurance_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/fetch_my_insurances_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyAssistantDataFeature/Bloc/Repo/delete_assistant_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyAssistantDataFeature/Bloc/Repo/fetch_my_assistant_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/delete_services_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/fetch_my_services_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FetchMyAssistantController extends GetxController {
  List<AssistantModel> _myAssistantList = [];

  List<AssistantModel> get myAssistantList => _myAssistantList;
  RequestStatus status = RequestStatus.initial;

  void addAssistantLocal(AssistantModel newAssistant) {
    myAssistantList.insert(0, newAssistant);
    update();
  }

  final FetchMyAssistantRepository _fetchMyAssistantRepository =
      FetchMyAssistantRepository();

  Future<void> fetchMyAssistant() async {
    // _myAssistantList = [...myAssistantExample];
    // update();
    status = RequestStatus.loading;
    var response = await _fetchMyAssistantRepository.fetchMyAssistant();
    status = RequestStatus.done;
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _myAssistantList.clear();
      for (var item in response.data['data']) {
        _myAssistantList.add(AssistantModel.fromJson(item));
      }
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    } else {
      status = RequestStatus.error;
      update();
    }
  }

  final DeleteAssistantRepository _deleteAssistantRepository =
      DeleteAssistantRepository();
  SnackbarStatus? _snackBarStatus = SnackbarStatus.CLOSED;
  SnackbarStatus? get snackBarStatus => _snackBarStatus;
  Future<void> deleteAssistant(
      {required int assistantId,}) async {
    int index = _myAssistantList.indexWhere((element) => element.id==assistantId);
    setLoading();
    var response = await _deleteAssistantRepository.deleteAssistant(assistantId: assistantId);
    Get.back();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _myAssistantList.removeAt(index);
      debugPrint("convert operation success");
      status = RequestStatus.done;
      customSnackBar(
        title: response.data["message"] ?? "Error",
        snackBarStatus: (SnackbarStatus? status) {
          _snackBarStatus = status;
          update();
          debugPrint("SnackbarStatus is $status");
        },
      );
      update();
    } else {
      status = RequestStatus.error;
      customSnackBar(
        title: response.data["message"] ?? "Error",
        snackBarStatus: (SnackbarStatus? status) {
          _snackBarStatus = status;
          update();
          debugPrint("SnackbarStatus is $status");
        },
      );
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchMyAssistant();
  }
}

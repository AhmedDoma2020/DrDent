import 'package:dr_dent/Src/bloc/model/detection_location_details_model.dart';
import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/bloc/model/service_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/delete_insurance_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/fetch_my_insurances_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/Bloc/Repository/delete_detection_location_details_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/Bloc/Repository/featch_detection_location_details_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/delete_services_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/fetch_my_services_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FetchDetectionLocationDetailsController extends GetxController {
  List<DetectionLocationDetailsModel> _myDetectionLocationDetails = [];
  List<DetectionLocationDetailsModel> get myDetectionLocationDetails => _myDetectionLocationDetails;
  RequestStatus status = RequestStatus.initial;


  int _indexSelected = -1;
  int get indexSelected => _indexSelected;
  void changeSIndex(value) {
    _indexSelected = value;
    update();
  }

  final FetchDetectionLocationDetailsRepository _fetchDetectionLocationDetailsRepository = FetchDetectionLocationDetailsRepository();
  Future<void> fetchMyDetectionLocationDetails() async {
    status = RequestStatus.loading;
    var response = await _fetchDetectionLocationDetailsRepository.fetchMyDetectionLocationDetails();
    status = RequestStatus.done;
    update();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint(" atfatshet");
      debugPrint("request operation success");
      _myDetectionLocationDetails.clear();
      for (var item in response.data['data']) {
        _myDetectionLocationDetails.add(DetectionLocationDetailsModel.fromJson(item));
      }
      // customSnackBar(title: response.data["message"]??"Error");
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    } else {
      status = RequestStatus.error;
      customSnackBar(title: response.data["message"]??"Error");
      update();
    }
  }

  void deleteMyDetectionLocationDetailsLocal({required int id}){
    int index = _myDetectionLocationDetails.indexWhere((element) => element.id==id);
    _myDetectionLocationDetails.removeAt(index);
    update();
  }

  final DeleteDetectionLocationDetailsRepository _deleteDetectionLocationDetailsRepository = DeleteDetectionLocationDetailsRepository();
  Future<void> deleteMyDetectionLocationDetails({required int detectionId}) async {
    debugPrint("deleteMyDetectionLocationDetails");
    setLoading();
    var response = await _deleteDetectionLocationDetailsRepository.deleteMyDetectionLocationDetails(id: detectionId);
    Get.back();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      deleteMyDetectionLocationDetailsLocal(id: detectionId);
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
    fetchMyDetectionLocationDetails();
  }
}

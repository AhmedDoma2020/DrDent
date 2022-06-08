import 'package:dr_dent/Src/bloc/model/certification_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/MyCertificationFeature/Bloc/Repo/delete_doctor_certification_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/MyCertificationFeature/Bloc/Repo/fetch_doctor_certification_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class FetchDoctorCertificationController extends GetxController {
  final List<CertificationModel> _certificationList=[];
  List<CertificationModel> get certificationList => _certificationList;
  RequestStatus status = RequestStatus.initial;
  final FetchDoctorCertificationRepo _fetchDoctorCertificationRepo =
  FetchDoctorCertificationRepo();
  Future<void> fetchCertification() async {
    status = RequestStatus.loading;
    var response = await _fetchDoctorCertificationRepo.fetchDoctorCertification();
  status = RequestStatus.done;
    if (response.statusCode == 200 && response.data["status"] == true) {
      _certificationList.clear();
      for(var item in response.data['data']){
        _certificationList.add(CertificationModel.fromJson(item));
      }
      update();
    }else{
      customSnackBar(title: response.data["message"]??"");
    }
  }

  void deleteCertificationLocal({required int id}){
    int certificationIndex = _certificationList.indexWhere((element) => element.id == id);
    _certificationList.removeAt(certificationIndex);
    update();
  }
  SnackbarStatus? _snackBarStatus = SnackbarStatus.CLOSED;
  SnackbarStatus? get snackBarStatus => _snackBarStatus;
  final DeleteDoctorCertificationRepo _deleteDoctorCertificationRepo =
  DeleteDoctorCertificationRepo();
  Future<void> deleteCertification({required int certificationId}) async {
    setLoading();
    update();
    var response = await _deleteDoctorCertificationRepo.deleteDoctorCertification(certificationId: certificationId);
    Get.back();
    update();
    if (response.statusCode == 200 && response.data["status"] == true) {
      deleteCertificationLocal(id: certificationId);
      customSnackBar(title: response.data["message"]??"",
        snackBarStatus: (SnackbarStatus? status) {
          _snackBarStatus = status;
          update();
          debugPrint("SnackbarStatus is $status");
        },);
      update();
    }else{
      customSnackBar(title: response.data["message"]??"",
        snackBarStatus: (SnackbarStatus? status) {
          _snackBarStatus = status;
          update();
          debugPrint("SnackbarStatus is $status");
        },);
      update();
    }
  }
  @override
  void onInit() {
    fetchCertification();
    super.onInit();
  }
}

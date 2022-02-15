import 'package:dr_dent/Src/bloc/model/assitant_model.dart';
import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/bloc/model/offer_and_discount_model.dart';
import 'package:dr_dent/Src/bloc/model/service_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/delete_insurance_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/fetch_my_insurances_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyAssistantDataFeature/Bloc/Repo/delete_assistant_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyOfferFeature/Bloc/Repo/delete_offer_and_discount_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyOfferFeature/Bloc/Repo/fetch_my_offer_and_discount_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/delete_services_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/fetch_my_services_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FetchMyOfferAndDiscountController extends GetxController {
  List<OfferAndDiscountModel> _myOfferAndDiscountList = [];
  List<OfferAndDiscountModel> get myOfferAndDiscountList => _myOfferAndDiscountList;
  RequestStatus status = RequestStatus.initial;
  void addOfferAndDiscountLocal(OfferAndDiscountModel newAssistant){
    _myOfferAndDiscountList.insert(0, newAssistant);
    update();
  }
  final FetchMyServicesRepository _fetchMyServicesRepository = FetchMyServicesRepository();
  final FetchMyOfferAndDiscountRepository _fetchMyOfferAndDiscountRepository = FetchMyOfferAndDiscountRepository();
  Future<void> fetchOfferAndDiscount() async {
    status = RequestStatus.loading;
    var response = await _fetchMyOfferAndDiscountRepository.fetchMyOfferAndDiscount();
    status = RequestStatus.done;
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _myOfferAndDiscountList.clear();
      for (var item in response.data['data']) {
        _myOfferAndDiscountList.add(OfferAndDiscountModel.fromJson(item));
      }
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    } else {
      status = RequestStatus.error;
      update();
    }
  }

  SnackbarStatus? _snackBarStatus = SnackbarStatus.CLOSED;
  SnackbarStatus? get snackBarStatus => _snackBarStatus;
  final DeleteOfferAndDiscountRepository _deleteOfferAndDiscountRepository = DeleteOfferAndDiscountRepository();
  Future<void> deleteOfferAndDiscount({required int offerAndDiscountId}) async {
    int indexWhere = _myOfferAndDiscountList.indexWhere((element) => element.id ==offerAndDiscountId );
    setLoading();
    var response = await _deleteOfferAndDiscountRepository.deleteOfferAndDiscount(offerAndDiscountId:  offerAndDiscountId);
    Get.back();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _myOfferAndDiscountList.removeAt(indexWhere);
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
      customSnackBar(title: response.data["message"]??"Error",
       snackBarStatus: (SnackbarStatus? status) {
          _snackBarStatus = status;
          update();
          debugPrint("SnackbarStatus is $status");
        },);
    } else {
      status = RequestStatus.error;
      customSnackBar(title: response.data["message"]??"Error",
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
    super.onInit();
    fetchOfferAndDiscount();
  }
}

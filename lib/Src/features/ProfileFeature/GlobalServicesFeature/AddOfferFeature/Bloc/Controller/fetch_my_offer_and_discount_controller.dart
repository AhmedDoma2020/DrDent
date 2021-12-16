import 'package:dr_dent/Src/bloc/model/assitant_model.dart';
import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/bloc/model/offer_and_discount_model.dart';
import 'package:dr_dent/Src/bloc/model/service_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/delete_insurance_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/fetch_my_insurances_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/AddAssistantDataFeature/Bloc/Repo/delete_assistant_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/AddOfferFeature/Bloc/Repo/delete_offer_and_discount_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/delete_services_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/fetch_my_services_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
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
  Future<void> fetchOfferAndDiscount() async {
    _myOfferAndDiscountList = [...offerAndDiscountListExamples];
    update();
    // var response = await _fetchMyServicesRepository.fetchMyServices();
    // if (response.statusCode == 200 && response.data["status"] == true) {
    //   print("request operation success");
    //   _myOfferAndDiscountList.clear();
    //   for (var item in response.data['waitingOrder']) {
    //     _myOfferAndDiscountList.add(OfferAndDiscountModel.fromJson(item));
    //   }
    //   print("convert operation success");
    //   status = RequestStatus.done;
    //   update();
    // } else {
    //   status = RequestStatus.error;
    //   update();
    // }
  }


  final DeleteOfferAndDiscountRepository _deleteOfferAndDiscountRepository = DeleteOfferAndDiscountRepository();
  Future<void> deleteAssistant({required int offerAndDiscountId, required int index}) async {
    _myOfferAndDiscountList.removeAt(index);
    update();
    // setLoading();
    // var response = await _deleteOfferAndDiscountRepository.deleteOfferAndDiscount(offerAndDiscountId:  offerAndDiscountId);
    // Get.back();
    // if (response.statusCode == 200 && response.data["status"] == true) {
    //   print("request operation success");
    //   _myOfferAndDiscountList.removeAt(index);
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
    fetchOfferAndDiscount();
  }
}

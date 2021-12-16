import 'package:dr_dent/Src/bloc/model/offer_and_discount_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/AddOfferFeature/Bloc/Repo/set_offer_and_discount_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'fetch_my_offer_and_discount_controller.dart';

class SetOfferAndDiscountController extends GetxController {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? priceController = TextEditingController();
  TextEditingController? offerInfoController = TextEditingController();
  TextEditingController? endDateController = TextEditingController();
  TextEditingController? bookingInfoController = TextEditingController();
  TextEditingController? imageController = TextEditingController();
  TextEditingController? priceAfterDiscountController = TextEditingController();
  TextEditingController? startDateController = TextEditingController();
  RequestStatus status = RequestStatus.initial;
  final FetchMyOfferAndDiscountController _fetchMyOfferAndDiscountController =
      Get.put(FetchMyOfferAndDiscountController());
  final SetOfferAndDiscountRepository _setOfferAndDiscountRepository =
      SetOfferAndDiscountRepository();

  Future<void> setOfferAndDiscount({required List<int> services}) async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      OfferAndDiscountModel newAssistant = OfferAndDiscountModel(
        offerStatus: 0,
        ownerName: "مركز وايتي كلينيك",
        name: nameController!.text,
        price: priceController!.text,
        id: 0,
        offerInfo: offerInfoController!.text,
        endDate: endDateController!.text,
        bookingInfo: bookingInfoController!.text,
        image: imageController!.text,
        priceAfterDiscount: priceAfterDiscountController!.text,
        services: [],
        startDate: startDateController!.text,
      );
      _fetchMyOfferAndDiscountController.addOfferAndDiscountLocal(newAssistant);
      update();
      Get.back();
      setLoading();
      var response = await _setOfferAndDiscountRepository.setOfferAndDiscount(
        title:  nameController!.text,
        startDate:  startDateController!.text,
        endDate: endDateController!.text,
        price:  priceController!.text,
        priceAfterOffer: priceAfterDiscountController!.text,
        offerInfo: offerInfoController!.text,
        bookingInfo: bookingInfoController!.text,
        image:  imageController!.text,
        serviceIds: services,
      );
      Get.back();
      if (response.statusCode == 200 && response.data["status"] == true) {
        print("request operation success");
        customSnackBar(title: response.data["message"] ?? "Done");
        print("convert operation success");
        status = RequestStatus.done;
        update();
        customSnackBar(title: "delete_success".tr);
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
    nameController = TextEditingController();
    priceController = TextEditingController();
    offerInfoController = TextEditingController();
    endDateController = TextEditingController();
    bookingInfoController = TextEditingController();
    imageController = TextEditingController();
    priceAfterDiscountController = TextEditingController();
    startDateController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController?.dispose();
    priceController?.dispose();
    offerInfoController?.dispose();
    endDateController?.dispose();
    bookingInfoController?.dispose();
    imageController?.dispose();
    priceAfterDiscountController?.dispose();
    startDateController?.dispose();
  }
}

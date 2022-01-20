import 'package:dr_dent/Src/bloc/model/offer_and_discount_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyOfferFeature/Bloc/Repo/set_offer_and_discount_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'fetch_my_offer_and_discount_controller.dart';

class SetOfferAndDiscountController extends GetxController {
  List<int> _servicesIdSelectedList = [];

  List<int> get servicesIdSelectedList => _servicesIdSelectedList;
  List<String> _servicesTitleSelectedList = [];

  List<String> get servicesTitleSelectedList => _servicesTitleSelectedList;
  String _startOfferDuration = "";

  set setStartOfferDuration(String value) {
    _startOfferDuration = value;
  }
  set setEndOfferDuration(String value) {
    _endOfferDuration = value;
  }
  int _durationNum = 0;
  set setDurationNum(int value) {
    _durationNum = value;
  }

  int get durationNum => _durationNum;
  String _endOfferDuration = "";

  String get endOfferDuration => _endOfferDuration;

  String get startOfferDuration => _startOfferDuration;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? servicesSelectedController = TextEditingController();
  TextEditingController? priceController = TextEditingController();
  TextEditingController? offerInfoController = TextEditingController();
  TextEditingController? bookingInfoController = TextEditingController();
  TextEditingController? imageController = TextEditingController();
  TextEditingController? priceAfterDiscountController = TextEditingController();
  TextEditingController? offerDurationController = TextEditingController();
  RequestStatus status = RequestStatus.initial;
  final FetchMyOfferAndDiscountController _fetchMyOfferAndDiscountController =
      Get.put(FetchMyOfferAndDiscountController());
  final SetOfferAndDiscountRepository _setOfferAndDiscountRepository =
      SetOfferAndDiscountRepository();

  Future<void> setOfferAndDiscount() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      if (imageController!.text.isEmpty) {
        customSnackBar(title: "must_be_set_photo".tr);
      } else {
        _setOfferAndDiscountRepository.setOfferAndDiscount(
          title: nameController!.text,
          startDate: _startOfferDuration,
          endDate: _endOfferDuration,
          price:priceController!.text,
          priceAfterOffer: priceAfterDiscountController!.text,
          offerInfo: offerInfoController!.text,
          bookingInfo: bookingInfoController!.text,
          image: imageController!.text,
          serviceIds: _servicesIdSelectedList,
        );
        OfferAndDiscountModel newOfferAndDiscount = OfferAndDiscountModel(
          offerStatus: 0,
          ownerName: "مركز وايتي كلينيك",
          name: nameController!.text,
          price: priceController!.text,
          id: 0,
          offerInfo: offerInfoController!.text,
          endDate: _endOfferDuration,
          bookingInfo: bookingInfoController!.text,
          image: imageController!.text,
          priceAfterDiscount: priceAfterDiscountController!.text,
          services: [],
          startDate: _startOfferDuration,
        );
        _fetchMyOfferAndDiscountController
            .addOfferAndDiscountLocal(newOfferAndDiscount);
        update();
        // Get.back();
        // setLoading();
        // var response = await _setOfferAndDiscountRepository.setOfferAndDiscount(
        //   title:  nameController!.text,
        //   startDate:  _startOfferDuration,
        //   endDate:_endOfferDuration,
        //   price:  priceController!.text,
        //   priceAfterOffer: priceAfterDiscountController!.text,
        //   offerInfo: offerInfoController!.text,
        //   bookingInfo: bookingInfoController!.text,
        //   image:  imageController!.text,
        //   serviceIds: _servicesIdSelectedList,
        // );
        // Get.back();
        // if (response.statusCode == 200 && response.data["status"] == true) {
        //   debugPrint("request operation success");
        //   customSnackBar(title: response.data["message"] ?? "Done");
        //   debugPrint("convert operation success");
        //   status = RequestStatus.done;
        //   update();
        //   customSnackBar(title: "delete_success".tr);
        // } else {
        //   status = RequestStatus.error;
        //   customSnackBar(title: response.data["message"] ?? "Error");
        //   update();
        // }
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    _servicesIdSelectedList = [];
    _servicesTitleSelectedList = [];
    nameController = TextEditingController();
    servicesSelectedController = TextEditingController();
    priceController = TextEditingController();
    offerInfoController = TextEditingController();
    bookingInfoController = TextEditingController();
    imageController = TextEditingController();
    priceAfterDiscountController = TextEditingController();
    offerDurationController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController?.dispose();
    servicesSelectedController?.dispose();
    priceController?.dispose();
    offerInfoController?.dispose();
    bookingInfoController?.dispose();
    imageController?.dispose();
    priceAfterDiscountController?.dispose();
    offerDurationController?.dispose();
  }
}

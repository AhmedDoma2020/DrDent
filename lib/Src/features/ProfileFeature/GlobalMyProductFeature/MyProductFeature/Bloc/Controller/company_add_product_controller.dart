import 'dart:developer';

import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalMyProductFeature/MyProductFeature/Bloc/Repository/company_add_product_repo.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/controller/compancy_products_controller.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';


class AddACompanyProductController extends GetxController {
  GetStorage box = GetStorage();
  TextEditingController? nameController;
  TextEditingController? expiredDateController;
  TextEditingController? textController;
  TextEditingController? usabilityController;
  TextEditingController? productRatingController;
  TextEditingController? jobTypeController;
  TextEditingController? jobDescriptionController;
  List<String> _images = [];
  List<String> get images => _images;
  set setSpecializationIdSelected(List<String> value) {
    _images = value;
  }

  int? _categoryId;
  int? get categoryId => _categoryId;
  set setCategoryId(int value) {
    _categoryId = value;
  }

  String _expireDate = "2022-02-29";
  String get expireDate => _expireDate;
  set setExpireDate(String value) {
    _expireDate = value;
  }


  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageFileList = [];
  List<XFile> get imageFileList => _imageFileList;
void deleteImage(int index){
  _imageFileList.removeAt(index);
  _images.removeAt(index);
  log("_imageFileList in deleteImage ${_imageFileList.length}");
  log("_images in deleteImage ${_images.length}");
  update();
}

  Future getImages() async {
    final imageFileList = (await _picker.pickMultiImage())!;
    if(imageFileList.length <= 4){
      _imageFileList = imageFileList;
      for (var item in imageFileList){
        final bytes = File(item.path).readAsBytesSync();
        String img64 = base64Encode(bytes);
        _images.add(img64);
      }
    }else{
      customSnackBar(title: "error_You_can_add_up_to_4_photos".tr);
    }
    update();
    log("_imageFileList in getImages ${_imageFileList.length}");
    log("_images in getImages ${_images.length}");
  }

  RequestStatus status = RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();


  final AddCompanyProductRepository _addCompanyProductRepository = AddCompanyProductRepository();
  void submit() async {
    if (globalKey.currentState!.validate()) {
     if(_images.isNotEmpty){
       globalKey.currentState!.save();
       setLoading();
       var response = await _addCompanyProductRepository.addCompanyProduct(
         title: nameController!.text,
         categoryId: categoryId!,
         expireDate: expireDate,
         text: textController!.text,
         usability: usabilityController!.text,
         // generalUse: generalUse,
         // sideEffects: sideEffects,
         images: images,
       );
       Get.back();
       if (response.statusCode == 200 && response.data["status"] == true) {
         debugPrint("request operation success");
         CompanyProductsController _companyProductsController = Get.put(CompanyProductsController(storeId: box.read('id')));
         _companyProductsController.fetchProducts();
         Get.back();
         customSnackBar(title: response.data['message']??"");
         debugPrint("convert operation success");
         status = RequestStatus.done;
         update();
       } else {
         status = RequestStatus.error;
         customSnackBar(title: response.data['message']??"");
         update();
       }
     } else{
       customSnackBar(title: "must_set_product_images".tr);
     }

    }
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    expiredDateController = TextEditingController();
    textController = TextEditingController();
    usabilityController = TextEditingController();
    productRatingController = TextEditingController();
    jobTypeController = TextEditingController();
    jobDescriptionController = TextEditingController();
    _images = [];
  }

  @override
  void dispose() {
    nameController?.dispose();
    expiredDateController?.dispose();
    textController?.dispose();
    usabilityController?.dispose();
    productRatingController?.dispose();
    jobTypeController?.dispose();
    jobDescriptionController?.dispose();
    super.dispose();
  }
}

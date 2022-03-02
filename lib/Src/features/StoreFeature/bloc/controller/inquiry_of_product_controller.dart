import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/login_repo.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/forget_password_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/account_type_screen.dart';
import 'package:dr_dent/Src/features/BaseFeature/ui/screens/base_screen.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../repository/inquiry_of_product_repo.dart';


class InquiryOfProductController extends GetxController{
  TextEditingController? phoneController;
  TextEditingController? nameController;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final InquiryOfProductRepository _inquiryOfProductRepository =InquiryOfProductRepository();
  GetStorage box = GetStorage();
  void submit({required int productId}) async{
    if(globalKey.currentState!.validate()){
      globalKey.currentState!.save();
      setLoading();
      var response = await _inquiryOfProductRepository.inquiryOfProduct(phone: phoneController!.text, name: nameController!.text,productId: productId);
      Get.back();
      if(response.statusCode == 200 && response.data["status"] == true){
        Get.back();
        customSnackBar(title: response.data["message"]??"");
      }else{
        customSnackBar(title: response.data["message"]??"");
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    nameController = TextEditingController();
    debugPrint('box.read phone is ${box.read('phone')??"no"}');
    debugPrint('box.read name is ${box.read('name')??"no"}');
    phoneController!.text = box.read('phone')??"";
    nameController!.text = box.read('name')??"";
  }


  @override
  void dispose() {
    phoneController?.dispose();
    nameController?.dispose();
    super.dispose();
  }

}
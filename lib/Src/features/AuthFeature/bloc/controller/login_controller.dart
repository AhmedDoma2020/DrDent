import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/login_repo.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/forget_password_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/account_type_screen.dart';
import 'package:dr_dent/Src/features/BaseFeature/ui/screens/base_screen.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class LoginController extends GetxController{
  TextEditingController? phoneController;
  TextEditingController? passwordController;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
 final LogInRepository _logInRepository =LogInRepository();
 GetStorage box = GetStorage();
  void submit() async{
    if(globalKey.currentState!.validate()){
      globalKey.currentState!.save();
      setLoading();
       globalKey.currentState!.save();
      // setLoadingDialog();
      var response = await _logInRepository.logIn(phone: phoneController!.text, password: passwordController!.text,);
      Get.back();
     if(response.statusCode == 200 && response.data["status"] == true){
       box.write("id", response.data["data"]["id"]);
       box.write("name", response.data["data"]["name"]);
       box.write("phone", response.data["data"]["phone"]);
       box.write("email", response.data["data"]["email"]);
       box.write("country_id", response.data["data"]["country_id"]);
       box.write("state_id", response.data["data"]["state_id"]);
       box.write("city_id", response.data["data"]["city_id"]);
       box.write("address", response.data["data"]["address"]);
       box.write("lat", response.data["data"]["lat"]);
       box.write("lon", response.data["data"]["lon"]);
       box.write("user_type_id", response.data["data"]["user_type_id"]);
       box.write("phone_verified", response.data["data"]["phone_verified"]);
       box.write("image", response.data["data"]["image"]);
       box.write("api_token", response.data["data"]["api_token"]);
       customSnackBar(title: response.data["message"]??"");
       Get.offAll(()=>BaseScreen());
       // Get.to(()=>SetDetectionLocationDetailsScreen());
     }else{
       customSnackBar(title: response.data["message"]??"");
     }
    }
  }

  void moveToForgetPassword(){
    Get.to(()=>ForgetPasswordScreen());
  }

  void moveToRegister(){
    // Get.back();
    Get.to(()=>AccountTypeScreen());
  }

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }


  @override
  void dispose() {
    phoneController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

}
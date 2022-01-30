

import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/services/sign_in_with_google.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/login_repo.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/login_with_gmail_repo.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/forget_password_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/account_type_screen.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class LoginWithGoogleIdController extends GetxController{

  final LogInWithEmailRepository _logInWithEmailRepository =LogInWithEmailRepository();
  GetStorage box = GetStorage();

  Future signInWithGoogleMethod() async{
    final user = await GoogleSignInMethod.logIn();
    if(user == null){
      customSnackBar(title: "Error in signInWithGoogleMethod");
    }else{
      debugPrint("user.displayName  ${user.displayName}");
      debugPrint("user.displayName.lest  ${user.displayName!.split(" ")}");
      debugPrint("user.displayName.first  ${user.displayName!.split(" ")[0]}");
      debugPrint("user.displayName.last  ${user.displayName!.split(" ")[1]}");
      debugPrint("user.email  ${user.email}");
      debugPrint("user.photoUrl  ${user.photoUrl}");
      debugPrint("user.id  ${user.id}");
      signInWithGoogle(googleEmail:user.email ,googleId:user.id ,firstName:user.displayName!.split(" ")[0],lastName: user.displayName!.split(" ")[1]);
    }
  }



  void signInWithGoogle({required String googleEmail,required String googleId,required String firstName,required String lastName}) async{
      setLoading();
      var response = await _logInWithEmailRepository.logInWithEmail(email:googleEmail ,googleId: googleId,);
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
        customSnackBar(title: "log in success".tr);
      }else{
        customSnackBar(title: response.data["message"]??"");
      }

  }
}
import 'package:dr_dent/Src/bloc/controller/navigation_routs_controller.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/verify_phone_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/register_repo.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/set_business_license_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/set_commercial_registration_and_tax_card_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/start_now_screen.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  RequestStatus status = RequestStatus.initial;
  TextEditingController? nameController;
  TextEditingController? administratorsNameController;
  TextEditingController? phoneController;
  TextEditingController? administratorsPhoneController;
  TextEditingController? passwordController;
  TextEditingController? emailController;
  int _userTypeId = -1;

  int get userTypeId => _userTypeId;

  set setUserTypeId(int value) {
    _userTypeId = value;
  }

  String _image = '';

  String get image => _image;

  set setImage(String value) {
    _image = value;
  }

  GetStorage box = GetStorage();
  final RegisterRepository _registerRepository = RegisterRepository();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  VerifyPhoneController verifyPhoneController = Get.put(VerifyPhoneController());
  void submit() async {
    if (globalKey.currentState!.validate()) {
      if (_image != "") {
        globalKey.currentState!.save();
        setLoading();
        var response = await _registerRepository.register(
          name: nameController!.text,
          phone: phoneController!.text,
          image: _image,
          userType: _userTypeId,
          administratorName: administratorsNameController!.text,
          administratorPhone: administratorsPhoneController!.text,
          password: passwordController!.text,
        );
        Get.back();
        update();
        if (response.statusCode == 200 && response.data['status'] == true) {
          debugPrint("request operation success");
          if (response.data['data'] != null) {
            // Get.offAll(()=>VerficationScreen(phone: phoneController!.text,));
            box.write('id', response.data['data']['id']);
            box.write('name', response.data['data']['name']);
            box.write('phone', response.data['data']['phone']);
            box.write('email', response.data['data']['email']);
            box.write('country_id', response.data['data']['country_id']);
            box.write('city_id', response.data['data']['city_id']);
            box.write('address', response.data['data']['address']);
            box.write('lat', response.data['data']['lat']);
            box.write('lon', response.data['data']['lon']);
            box.write('user_type_id', response.data['data']['user_type_id']);
            box.write('phone_verified', response.data['data']['phone_verified']);
            box.write('image', response.data['data']['image']);
            box.write('notify_status', response.data['data']['notify_status']);
            box.write('api_token', response.data['data']['api_token']);
            box.write('rate_number', response.data['data']['rate_number']);
            box.write('average_rate', response.data['data']['average_rate']);
            // PhoneVerifyController.verifyPhone(phone: phoneController!.text,onSuccess: ()async{
            //   await verifyPhoneController.setVerify();
            // });
          }
          debugPrint("api_token in register is ${box.read('api_token')}");
          debugPrint("user_type_id in register is ${box.read('user_type_id')}");
          navigationAfterSelectAccountType(grade: response.data['data']['user_type_id']);
          debugPrint("convert operation success");
          box.write('log_in',1);
          status = RequestStatus.done;
          update();
        } else {
          status = RequestStatus.error;
          customSnackBar(title: response.data["message"] ?? "Error");
          update();
        }
      } else {
        customSnackBar(title: "must_add_account_avatar".tr);
      }
    }
  }

  // void onForgetPassword(){
  //   Get.to(()=>CheckPhoneScreen());
  // }
  //
  // void moveToRegister(){
  //   // Get.back();
  //   Get.to(()=>RegisterScreen());
  // }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    administratorsNameController = TextEditingController();
    phoneController = TextEditingController();
    administratorsPhoneController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    nameController?.dispose();
    administratorsNameController?.dispose();
    phoneController?.dispose();
    administratorsPhoneController?.dispose();
    passwordController?.dispose();
    emailController?.dispose();
    super.dispose();
  }
}



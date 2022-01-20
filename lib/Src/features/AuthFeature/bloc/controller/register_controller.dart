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
  VerifyPhoneController verifyPhoneController =
      Get.put(VerifyPhoneController());

  actionVisitStatus({required int grade}) {
    switch (grade) {
      // ToDo register as patient
      case 2:
        Get.offAll(() => StartNowScreen());
        break;
      // ToDo register as doctor
      case 3:
        Get.offAll(() => SetBusinessLicenseScreen(
              title: "business_license",
              sibTitle: "business_license_sup_title",
            ));
        break;
      // ToDo register as center
      case 4:
        // Get.offAll(() => SetCommercialRegistrationAndTaxCardScreen());
        Get.offAll(() => StartNowScreen());
        break;
      // ToDo register as company
      case 5:
        Get.offAll(() => SetCommercialRegistrationAndTaxCardScreen());
        break;

      // ToDo register as lab
      case 6:
        Get.offAll(() => SetCommercialRegistrationAndTaxCardScreen());
        break;

      // ToDo register as graduation
      case 7:
        Get.offAll(() => SetBusinessLicenseScreen(
              title: "graduation_certificate",
              sibTitle: "upload_a_photo_of_your_graduation_certificate",
            ));
        break;

      default:
        customSnackBar(title: "Error of user type Id");
        break;
    }
  }

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
            box.write('api_token', response.data['data']['api_token']);
            // PhoneVerifyController.verifyPhone(phone: phoneController!.text,onSuccess: ()async{
            //   await verifyPhoneController.setVerify();
            // });
          }
          actionVisitStatus(grade: _userTypeId);
          debugPrint("convert operation success");
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

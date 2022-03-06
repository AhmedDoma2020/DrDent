import 'package:dr_dent/Src/features/AuthFeature/ui/screens/set_business_license_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/set_commercial_registration_and_tax_card_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/start_now_screen.dart';
import 'package:dr_dent/Src/features/BaseFeature/ui/screens/base_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/MyGeneralDataFeature/Ui/Screen/enter_personal_data_of_graduated.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/View/Screens/set_detection_location_details_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/View/button_tap_bar_widget_of_center.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/View/button_tap_bar_widget_of_company.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/View/button_tap_bar_widget_of_doctor.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/View/button_tap_bar_widget_of_graduated.dart';
import '../../features/SocialProfileFeature/SocialProfileScreen/View/Screen/social_profile_ios_tap_bar_widget_of_doctor.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/controller/work_time_controller.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/screens/work_time_screen.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

navigationAfterSelectAccountType({required int grade}) {
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
      Get.offAll(() => SetCommercialRegistrationAndTaxCardScreen());
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

navigationAfterStartNowScreen({required int grade}) {
  GetStorage box = GetStorage();
  switch (grade) {
    // // ToDo register as patient
    //   case 2:
    //     Get.offAll(() => StartNowScreen());
    //     break;
    // ToDo register as doctor
    case 3:
      Get.offAll(() => SetDetectionLocationDetailsScreen(
            isAuth: true,
          ));
      break;
    // ToDo register as center
    case 4:
      Get.offAll(() => SetDetectionLocationDetailsScreen(
            isAuth: true,
          ));
      break;
    // ToDo register as company
    case 5:
      Get.offAll(() => WorkTimeScreen(
            userType: UserTypeEnum.company,
            onSuccess: () {
              Get.offAll(() => BaseScreen());
            },
            workspaceId: box.read('id') ?? 0,
          ));
      break;
    // ToDo register as lab
    case 6:
      Get.offAll(() => WorkTimeScreen(
            userType: UserTypeEnum.company,
            onSuccess: () {
              Get.offAll(() => BaseScreen());
            },
            workspaceId: box.read('id') ?? 0,
          ));
      break;
    // ToDo register as graduation
    case 7:
      Get.offAll(() => EnterPersonalDataOfGraduatedScreen());
      break;
    default:
      customSnackBar(title: "Error of user type Id");
      break;
  }
}

Widget profileIOSTapBarType({required int userTypeId , required int userId}) {
  switch (userTypeId) {
    case 3:
      {
        return  ButtonTapBarWidgetOfDoctor(userId: userId,);
      }
    case 4:
      {
        return  ButtonTapBarWidgetOfCenter(userId: userId,);
      }
    case 5:
      {
        return  ButtonTapBarWidgetOfCompany(userId: userId,);
      }
    case 6:
      {
        return  ButtonTapBarWidgetOfCompany(userId: userId,);
      }
    case 7:
      {
        return  ButtonTapBarWidgetOfGraduated(userId: userId,);
      }
    default:
      {
        return Container();
      }
  }
}

Widget socialProfileIOSTapBarType({required int userTypeId, required int userId}) {
  switch (userTypeId) {
    case 3:
      {
        return  SocialIOSTapBarWidgetOfDoctor(userId: userId,);
      }
    case 4:
      {
        return  ButtonTapBarWidgetOfCenter(userId: userId,);
      }
    case 5:
      {
        return  ButtonTapBarWidgetOfCompany(userId: userId,);
      }
    case 6:
      {
        return  ButtonTapBarWidgetOfCompany(userId: userId,);
      }
    case 7:
      {
        return  ButtonTapBarWidgetOfGraduated(userId: userId,);
      }
    default:
      {
        return Container();
      }
  }
}

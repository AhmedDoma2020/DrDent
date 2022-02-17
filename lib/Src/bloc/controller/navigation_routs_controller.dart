  import 'package:dr_dent/Src/core/constants/color_constants.dart';
  import 'package:dr_dent/Src/core/utils/extensions.dart';
  import 'package:dr_dent/Src/features/AuthFeature/ui/screens/set_business_license_screen.dart';
  import 'package:dr_dent/Src/features/AuthFeature/ui/screens/set_commercial_registration_and_tax_card_screen.dart';
  import 'package:dr_dent/Src/features/AuthFeature/ui/screens/start_now_screen.dart';
  import 'package:dr_dent/Src/features/BaseFeature/ui/screens/base_screen.dart';
  import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/MyGeneralDataFeature/Ui/Screen/enter_personal_data_of_graduated.dart';
  import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/View/Screens/set_detection_location_details_screen.dart';
  import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/profile_tab_index_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/View/button_tap_bar_widget_of_center.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/View/button_tap_bar_widget_of_company.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/View/button_tap_bar_widget_of_doctor.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/View/button_tap_bar_widget_of_graduated.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/controller/work_time_controller.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/screens/work_time_screen.dart';
import 'package:get_storage/get_storage.dart';
  import '../../features/ProfileFeature/ProfileScreen/Ui/Widget/DoctorWidgets/global_information_details_widget_of_doctor.dart';
  import '../../features/ProfileFeature/ProfileScreen/Ui/Widget/DoctorWidgets/global_services_widget_of_doctor.dart';
  import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
  import 'package:dr_dent/Src/ui/widgets/tabs/tabs_ios.dart';
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get.dart';

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
    Get.offAll(()=>SetDetectionLocationDetailsScreen(isAuth: true,));
      break;
  // ToDo register as center
    case 4:
      Get.offAll(()=>SetDetectionLocationDetailsScreen(isAuth: true,));
      break;
  // ToDo register as company
    case 5:
      Get.offAll(() => WorkTimeScreen(
        userType: UserTypeEnum.company,
        onSuccess: () {
          Get.offAll(() =>  BaseScreen());
        },
        workspaceId: box.read('id')?? 0,
      ));
      break;
  // ToDo register as lab
    case 6:
      Get.offAll(() => WorkTimeScreen(
        userType: UserTypeEnum.company,
        onSuccess: () {
          Get.offAll(() =>  BaseScreen());
        },
        workspaceId: box.read('id')?? 0,
      ));
      break;
  // ToDo register as graduation
    case 7:
      Get.offAll(() =>  EnterPersonalDataOfGraduatedScreen());
      break;
    default:
      customSnackBar(title: "Error of user type Id");
      break;
  }
}

Widget buttonTapBarType({required int userTypeId}) {
  switch (userTypeId) {
    case 3:
      {
        return const ButtonTapBarWidgetOfDoctor();
      }
      case 4:
      {
        return const ButtonTapBarWidgetOfCenter();
      }
      case 5:
      {
        return const ButtonTapBarWidgetOfCompany();
      }
      case 6:
      {
        return const ButtonTapBarWidgetOfCompany();
      }
      case 7:
      {
        return const ButtonTapBarWidgetOfGraduated();
      }
    default:
      {
        return Container();
      }
  }

}








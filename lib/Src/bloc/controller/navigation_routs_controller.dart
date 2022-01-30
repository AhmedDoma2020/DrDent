import 'package:dr_dent/Src/features/AuthFeature/ui/screens/set_business_license_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/set_commercial_registration_and_tax_card_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/start_now_screen.dart';
import 'package:dr_dent/Src/features/BaseFeature/ui/screens/base_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/View/Screens/set_detection_location_details_screen.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
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
      Get.offAll(() =>  BaseScreen());
      break;

  // ToDo register as lab
    case 6:
      Get.offAll(() =>  BaseScreen());
      break;

  // ToDo register as graduation
    case 7:
      Get.offAll(() =>  BaseScreen());
      break;
    default:
      customSnackBar(title: "Error of user type Id");
      break;
  }
}
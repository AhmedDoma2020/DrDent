import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/View/Screens/detection_location_details_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Ui/View/center_doctor_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyAssistantDataFeature/Ui/View/my_assistant_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyOfferFeature/Ui/View/my_offer_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Ui/View/Screen/my_services_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_column_info_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GlobalServicesWidgetOfDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.green,
      child: Column(
        children: [
          ProfileColumnInfoItem(
            icon:  "assets/icons/examination_and_clinic_data.png",
            title:"examination_and_clinic_data" ,
            onTap: () {
                Get.to(()=>DetectionLocationDetailsScreen());
            },
          ),
          16.0.ESH(),
          ProfileColumnInfoItem(
            icon: "assets/icons/my_services.png",
            title: "my_services",
            onTap: () {
              Get.to(()=>MyServicesScreen());
            },
          ),
          16.0.ESH(),
          ProfileColumnInfoItem(
            icon: "assets/icons/assistant_data.png",
            title: "assistant_data",
            onTap: () {
              Get.to(()=>MyAssistantScreen());
            },
          ),
          16.0.ESH(),
          ProfileColumnInfoItem(
            icon: "assets/icons/Offers_and_discounts.png",
            title: "Offers_and_discounts",
            onTap: () {
              Get.to(()=>MyOfferScreen());
            },
          ),
        ],
      ),
    );
  }
}
//
//
// class GlobalServicesWidget extends StatelessWidget {
//   final int userTypeId;
//   GlobalServicesWidget({required this.userTypeId});
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       // color: Colors.green,
//       child: Column(
//         children: [
//           ProfileColumnInfoItem(
//             icon: userTypeId == 3? "assets/icons/examination_and_clinic_data.png":userTypeId == 4? "assets/icons/people.png":"",
//             title:userTypeId == 3?"examination_and_clinic_data" :userTypeId == 4?"center_doctors" :"Error ID",
//             onTap: () {
//               if(userTypeId == 3){
//                 Get.to(()=>DetectionLocationDetailsScreen());
//               }else if (userTypeId == 4){
//                 Get.to(()=>MyDoctorScreen());
//               }
//             },
//           ),
//           16.0.ESH(),
//           ProfileColumnInfoItem(
//             icon: "assets/icons/my_services.png",
//             title: "my_services",
//             onTap: () {
//               Get.to(()=>MyServicesScreen());
//             },
//           ),
//           16.0.ESH(),
//           ProfileColumnInfoItem(
//             icon: "assets/icons/assistant_data.png",
//             title: "assistant_data",
//             onTap: () {
//               Get.to(()=>MyAssistantScreen());
//             },
//           ),
//           16.0.ESH(),
//           ProfileColumnInfoItem(
//             icon: "assets/icons/Offers_and_discounts.png",
//             title: "Offers_and_discounts",
//             onTap: () {
//               Get.to(()=>MyOfferScreen());
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

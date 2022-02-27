import 'package:dr_dent/Src/features/ProfileFeature/GlobalMyProductFeature/MyProductFeature/View/Screens/company_products_screen.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_profile_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_column_info_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalMyProductWidget extends StatelessWidget {
  const GlobalMyProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.green,
      child: GetBuilder<FetchProfileController>(
        builder: (_) => ProfileColumnInfoItem(
          icon: "assets/icons/personalInfoIcon.png",
          title: "company_products",
          onTap: () {
            Get.to(() => const CompanyProductsScreen() );
            },
        ),
      ),
    );
  }
}
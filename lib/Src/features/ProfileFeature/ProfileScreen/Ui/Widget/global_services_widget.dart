import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_column_info_item.dart';
import 'package:flutter/material.dart';


class GlobalServicesWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.green,
      child: Column(
        children: [
          ProfileColumnInfoItem(
            icon: "assets/icons/examination_and_clinic_data.png",
            title: "examination_and_clinic_data",
            onTap: () {},
          ),
          16.0.ESH(),
          ProfileColumnInfoItem(
            icon: "assets/icons/my_services.png",
            title: "my_services",
            onTap: () {},
          ),
          16.0.ESH(),
          ProfileColumnInfoItem(
            icon: "assets/icons/assistant_data.png",
            title: "assistant_data",
            onTap: () {},
          ),
          16.0.ESH(),
          ProfileColumnInfoItem(
            icon: "assets/icons/Offers_and_discounts.png",
            title: "Offers_and_discounts",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

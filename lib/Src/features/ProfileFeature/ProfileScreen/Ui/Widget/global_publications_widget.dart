import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_column_info_item.dart';
import 'package:flutter/material.dart';


class GlobalPublicationsWidget extends StatelessWidget {
  const GlobalPublicationsWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.green,
      child: Column(
        children: [
          ProfileColumnInfoItem(
            icon: "assets/icons/personalInfoIcon.png",
            title: "my_general_data",
            onTap: () {},
          ),
          16.0.ESH(),
          ProfileColumnInfoItem(
            icon: "assets/icons/certificationIcon.png",
            title: "my_certification",
            onTap: () {},
          ),
          16.0.ESH(),
          ProfileColumnInfoItem(
            icon: "assets/icons/insuranceCompany.png",
            title: "insurance_companies",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

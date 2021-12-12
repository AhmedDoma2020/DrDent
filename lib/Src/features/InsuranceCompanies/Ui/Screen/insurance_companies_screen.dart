import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class InsuranceCompanies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBars.appBarDefault(title: "insurance_companies".tr,onTap: (){Get.back();}),
        body: Container(
          color: Colors.red,
          height: double.infinity,
          width: double.infinity,
          child: ,
        ),
      ),
    );
  }
}

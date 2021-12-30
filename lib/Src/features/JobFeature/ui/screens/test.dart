import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_job_request_bottun_sheet.dart';
import 'enter_your_information_to_apply_button_sheet.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.small(onPressed: () {
          Get.bottomSheet(
            EnterYourInformationButtonSheet(
              // onTap: (stateId, cityId) {
              //   //TODO do filter jobs
              // },
            ),
            isScrollControlled: true,
          );
        }),
        body: Container(),
      ),
    );
  }
}

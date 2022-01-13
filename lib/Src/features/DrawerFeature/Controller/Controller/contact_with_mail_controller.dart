
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/enter_and_edit_my_personal_data_repo.dart';
import 'package:dr_dent/Src/features/DrawerFeature/Controller/Repository/contact_with_mail_repo.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/Repository/add_a_jop_offer_repo.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/Repository/add_jop_request_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ContactWithUSController extends GetxController {
  GetStorage box = GetStorage();
  TextEditingController? emailController;
  TextEditingController? messageController;
  RequestStatus status = RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final ContactWithUsRepository _contactWithUsRepository =
  ContactWithUsRepository();
  void submit() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
// setLoadingDialog();
      var response = await _contactWithUsRepository.contactWithUs(
        message:messageController!.text ,
        email: emailController!.text,
      );
      if (response.statusCode == 200 && response.data["status"] == true) {
        print("request operation success");

        print("convert operation success");
        status = RequestStatus.done;
        update();
      } else {
        status = RequestStatus.error;
        update();
      }

    }
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    messageController = TextEditingController();

  }

  @override
  void dispose() {
    emailController?.dispose();
    messageController?.dispose();
    super.dispose();
  }


}

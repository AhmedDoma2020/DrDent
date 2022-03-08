import 'package:dr_dent/Src/bloc/controller/navigation_routs_controller.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/featch_profile_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/profile_tab_index_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_info_widget.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/profile_row_info_widget.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileScreen extends StatelessWidget {
   const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    debugPrint("box.read('user_type_id') in profile is ${box.read('user_type_id')}");
    Get.put(FetchProfileController());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<FetchProfileController>(
          builder:(proController) => proController.status == RequestStatus.loading ? Center(child: Loader(),):
             ListView(
              children: [
                profileInfoWidget(),
                8.0.ESH(),
                ProfileRowInfoAndRate(),

                profileIOSTapBarType(userTypeId:
                // box.read('user_type_id')??
                    7,userId:proController.id! ),
              ],
            ),
        ),
      ),
    );
  }
}


import 'package:dr_dent/Src/bloc/model/user_profile_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Repo/featch_profile_repo.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/Block/Repository/block_user_repo.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/Block/Repository/featch_social_profile_repo.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/Block/Repository/report_user_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BlockUserController extends GetxController {


  RequestStatus status = RequestStatus.initial;
  final BlockUserRepository _blockUserRepository = BlockUserRepository();

  Future<void> blockUser({required int userId}) async {
    setLoading();
    var response = await _blockUserRepository.blockUser(userId: userId);
    Get.back();
    status = RequestStatus.done;
    update();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      customSnackBar(title: response.data['message']?? "",);
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    } else {
      customSnackBar(title: response.data['message']?? "",);
      status = RequestStatus.error;
      update();
    }
  }

}

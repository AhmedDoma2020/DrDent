import 'package:dr_dent/Src/bloc/model/user_profile_model.dart';
import 'package:dr_dent/Src/bloc/repository/follow_and_un_follow_repo.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Repo/featch_profile_repo.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/Block/Repository/featch_social_profile_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FollowAndUnFollowController extends GetxController {
bool _isLoading =false ;

bool get isLoading => _isLoading;
  GetStorage  box = GetStorage();
  RequestStatus status = RequestStatus.initial;
  final FollowAndUnFollowRepository _followAndUnFollowRepository = FollowAndUnFollowRepository();

  Future<void> followAndUnFollow({required int userId ,required  Function onSuccess}) async {
    // setLoading();
    _isLoading = true;
    update();
    var response = await _followAndUnFollowRepository.followAndUnFollow(userId: userId);
    // Get.back();
    _isLoading = false;
    update();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      customSnackBar(title: response.data["message"]??"Done");
      onSuccess();
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    } else {
      // customSnackBar(title: response.data["message"]??"Done");
      status = RequestStatus.error;
      update();
    }
  }


}

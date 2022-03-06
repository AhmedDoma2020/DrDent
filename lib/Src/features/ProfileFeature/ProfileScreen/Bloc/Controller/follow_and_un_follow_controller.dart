import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Repo/follow_and_un_follow_repo.dart';

class FollowAndUnFollowController extends GetxController {

  RequestStatus status = RequestStatus.initial;
  final  FollowAndUnFollowRepository _followAndUnFollowRepository =FollowAndUnFollowRepository();
  Future<void> followAndUnFollow({required int id}) async {
    setLoading();
    var response = await _followAndUnFollowRepository.followAndUnFollow(userId: id);
    Get.back();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      customSnackBar(title: response.data["message"]??"Done");
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    } else {
      status = RequestStatus.error;
      customSnackBar(title: response.data["message"]??"Error");
      update();
    }
  }
}

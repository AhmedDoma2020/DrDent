import 'package:dr_dent/Src/bloc/model/followers_model.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Repo/following_repo.dart';

class FetchFollowingController extends GetxController {
  final int userId ;

  FetchFollowingController({required this.userId});

  List<FollowersModel> _followingList=[];
  List<FollowersModel> get followingList => _followingList;
  RequestStatus status = RequestStatus.initial;
  final FollowingRepository _followingRepository = FollowingRepository();

  Future<void> fetchFollowing() async {
    status = RequestStatus.loading;
    var response = await _followingRepository.fetchFollowing(userId: userId);
    status = RequestStatus.done;
    update();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _followingList.clear();
      for (var item in response.data['data']) {
        _followingList.add(FollowersModel.fromJson(item));
      }
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    } else {
      status = RequestStatus.error;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchFollowing();
  }
}

import 'package:dr_dent/Src/bloc/model/followers_model.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Repo/followers_repo.dart';

class FetchFollowersController extends GetxController {
  final int userId ;

  FetchFollowersController({required this.userId});

  List<FollowersModel> _followersList=[];
  List<FollowersModel> get followersList => _followersList;
  GetStorage  box = GetStorage();
  RequestStatus status = RequestStatus.initial;
  final FollowersRepository _followersRepository = FollowersRepository();

  Future<void> fetchFollowers() async {
    status = RequestStatus.loading;
    var response = await _followersRepository.fetchFollowers(userId: userId);
    status = RequestStatus.done;
    update();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _followersList.clear();
      for (var item in response.data['data']) {
        _followersList.add(FollowersModel.fromJson(item));
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
    fetchFollowers();
  }
}

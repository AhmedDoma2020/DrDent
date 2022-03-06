import 'package:dr_dent/Src/bloc/model/user_profile_model.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Repo/featch_profile_repo.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/Block/Repository/featch_social_profile_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FetchProfileController extends GetxController {
  final int userId;

  FetchProfileController({required this.userId});

  UserProfileModel? _userProfileModel;

  UserProfileModel? get userProfileModel => _userProfileModel;
  GetStorage  box = GetStorage();
  RequestStatus status = RequestStatus.initial;
  final FetchSocialProfileRepository _fetchSocialProfileRepository = FetchSocialProfileRepository();

  Future<void> fetchProfileDoctor() async {
    status = RequestStatus.loading;
    var response = await _fetchSocialProfileRepository.fetchSocialProfile(userId: userId);
    status = RequestStatus.done;
    update();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      if(response.data['data']!=null){
        _userProfileModel = response.data['data'];
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
    fetchProfileDoctor();
  }

}

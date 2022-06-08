import 'package:dr_dent/Src/bloc/model/user_profile_model.dart';
import 'package:dr_dent/Src/bloc/model/user_service_model.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Repo/featch_profile_repo.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/Block/Repository/featch_social_profile_repo.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/UserServicesWidget/Bolc/Repository/featch_user_services_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FetchUserServicesController extends GetxController {
  final int userId;
  FetchUserServicesController({required this.userId});

  List<UserServiceModel> _userServiceModel = [];
  List<UserServiceModel> get userServiceModel => _userServiceModel;
  RequestStatus status = RequestStatus.initial;
  final FetchUserServicesRepository _fetchUserServicesRepository = FetchUserServicesRepository();

  Future<void> fetchSocialProfile() async {
    status = RequestStatus.loading;
    var response = await _fetchUserServicesRepository.fetchUSerServices(userId: userId);
    status = RequestStatus.done;
    update();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      debugPrint("response.data['data'] profile is ${response.data['data']}");
      _userServiceModel.clear();
      if(response.data['data']!=null){
        for (var item in response.data['data']) {
          _userServiceModel.add(UserServiceModel.fromJson(item));
        }
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
    fetchSocialProfile();
  }

}

import 'package:dr_dent/Src/bloc/model/detection_location_details_model.dart';
import 'package:dr_dent/Src/bloc/model/user_profile_model.dart';
import 'package:dr_dent/Src/bloc/model/user_service_model.dart';
import 'package:dr_dent/Src/bloc/model/user_work_space_model.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Repo/featch_profile_repo.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/Block/Repository/featch_social_profile_repo.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/UserServicesWidget/Bolc/Repository/featch_user_services_repo.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/UserServicesWidget/Bolc/Repository/featch_user_work_spaces_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FetchUserWorkSpacesController extends GetxController {
  final int userId;
  FetchUserWorkSpacesController({required this.userId});
  List<WorkSpaceDetailsModel> _userWorkSpaces = [];
  List<WorkSpaceDetailsModel> get userWorkSpaces => _userWorkSpaces;
  RequestStatus status = RequestStatus.initial;
  final FetchUserWorkspacesRepository _fetchUserWorkspacesRepository = FetchUserWorkspacesRepository();
  Future<void> fetchSocialProfile() async {
    status = RequestStatus.loading;
    var response = await _fetchUserWorkspacesRepository.fetchUSerServices(userId: userId);
    status = RequestStatus.done;
    update();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      debugPrint("response.data['data'] profile is ${response.data['data']}");
      _userWorkSpaces.clear();
      if(response.data['data']!=null){
        for (var item in response.data['data']) {
          _userWorkSpaces.add(WorkSpaceDetailsModel.fromJson(item));
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

import 'package:dr_dent/Src/bloc/model/post_model.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_offers_repository.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/repository/social_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SocialController extends GetxController{
  RequestStatus status = RequestStatus.initial;
  List<PostModel> _posts = [];
  List<PostModel> get posts => _posts;

  // ========== START FETCH DATA  ====================
  final SocialRepository _socialRepository = SocialRepository();
  Future<void> fetchSocial()async{
    status = RequestStatus.loading;
    update();
    var response = await _socialRepository.fetchSocial();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      if(response.data['data']!=null){
        _posts.clear();
        if(response.data['data']['data']!=null){
          for (var item in response.data['data']['data']) {
            _posts.add(PostModel.fromJson(item));
          }
        }
      }
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    }else{
      status = RequestStatus.error;
      update();
    }
  }
  // ================  END FETCH DATA  ====================

  @override
  void onInit() {
    super.onInit();
    fetchSocial();
  }

}
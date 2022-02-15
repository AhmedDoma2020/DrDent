import 'package:dr_dent/Src/bloc/model/post_model.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_offers_repository.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalPublicationsFeature/bloc/Repository/my_social_repository.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Controller/like_post_controller.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/repository/social_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MySocialController extends GetxController{
  //
  RequestStatus status = RequestStatus.initial;
  List<PostModel> _posts = [];
  List<PostModel> get posts => _posts;

  // ========== START FETCH DATA  ====================
  final MySocialRepository _mySocialRepository = MySocialRepository();
  Future<void> fetchSocial()async{
    status = RequestStatus.loading;
    update();
    var response = await _mySocialRepository.fetchMySocial();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      if(response.data['data']!=null){
        _posts.clear();
        for (var item in response.data['data']) {
          _posts.add(PostModel.fromJson(item));
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


  final LikePostController _likePostController = Get.put(LikePostController());
  Future<void> likePost({required int postId})async{
    int postIndex = _posts.indexWhere((element) => element.id == postId);
    _likePostController.likePost(
        onSuccess: (){
          if(_posts[postIndex].like==1){
            _posts[postIndex].like = 0 ;
            _posts[postIndex].likesNumber = _posts[postIndex].likesNumber !- 1;

          }else{
            _posts[postIndex].like = 1 ;
            _posts[postIndex].likesNumber = _posts[postIndex].likesNumber !+ 1 ;
          }
         update();
        },
        postId: postId
    );
  }


  void increasePostCommentCounts({required int postId}){
    int postIndex = _posts.indexWhere((element) => element.id == postId);
    if(postIndex==null || postIndex<0){
    }else{
      _posts[postIndex].commentsNumber = _posts[postIndex].commentsNumber !+ 1;
      update();
    }

  }


  @override
  void onInit() {
    super.onInit();
    fetchSocial();
  }
}
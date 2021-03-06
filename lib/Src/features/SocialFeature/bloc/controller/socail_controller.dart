import 'package:dr_dent/Src/bloc/model/post_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_offers_repository.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Controller/like_post_controller.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Repository/delete_post_repo.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Repository/edit_post_repo.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/repository/social_repository.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Repository/share_post_repository.dart';

class SocialController extends GetxController{
  //
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
        // if(response.data['data']['data']!=null){
        //   for (var item in response.data['data']['data']) {
        //     _posts.add(PostModel.fromJson(item));
        //   }
        // }
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


  void deletePostLocal(int id){
    int index = _posts.indexWhere((element) => element.id == id);
    _posts.removeAt(index);
    update();
  }

  // final SocialController _socialController = Get.find();
  final DeletePostRepository _deletePostRepository =DeletePostRepository();

  // to delete post
  void deletePost({required int postId}) async {
    Get.closeCurrentSnackbar();
    setLoading();
    var response = await _deletePostRepository.deletePost(postId: postId);
    Get.back();
    if (response.statusCode == 200 && response.data["status"] == true) {
      // _socialController.deletePost(postId);
      deletePostLocal(postId);
      customSnackBar(title: response.data["message"]??"");
      debugPrint("convert operation success");
      update();
    } else {
      debugPrint('response in add post is $response');
      customSnackBar(title: response.data["message"]??"");
      update();
    }
  }

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
    if(postIndex == null || postIndex<0){
    }else{
      _posts[postIndex].commentsNumber = _posts[postIndex].commentsNumber !+ 1;
      update();
    }

  }



  // ========== START FETCH DATA  ====================
  final SharePostRepository _sharePostRepository = SharePostRepository();
  Future<void> sharePost({required int postId,String content = 'test',bool isPostShare=false})async{
    int postIndex = -1;
    if(isPostShare){
      postIndex=_posts.indexWhere((element) => element.shareId == postId);
    }else{
      postIndex=_posts.indexWhere((element) => element.id == postId);
    }
    if(postIndex<0){

    }else{
      _posts[postIndex].shareNumber = _posts[postIndex].shareNumber !+ 1;
    }
    // setLoading();
    update();
    var response = await _sharePostRepository.sharePost(postId: postId,content : content);
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      if(response.data['data']!=null){
        PostModel post = PostModel.fromJson(response.data['data']);
        _posts.insert(0, post);
      }
      debugPrint("convert operation success");
      update();
    }else{
      _posts[postIndex].shareNumber = _posts[postIndex].shareNumber !- 1;
      update();
    }
  }
  // ================  END FETCH DATA  ====================



  // ========== START EDIT DATA  ====================
  final EditPostRepository _editPostRepository = EditPostRepository();
  Future<void> editSharePost({required int postId,String content = ''})async{
    int postIndex=_posts.indexWhere((element) => element.id == postId);
    update();
    var response = await _editPostRepository.editPost(postId: postId,content : content,images: [],sharesId: [1],);
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      if(response.data['data']!=null){
        PostModel post = PostModel.fromJson(response.data['data']);
        _posts[postIndex]=post;
      }
      debugPrint("convert operation success");
      update();
    }else{
      update();
    }
  }
  // ================  END EDIT DATA  ====================




  @override
  void onInit() {
    super.onInit();
    fetchSocial();
  }
}
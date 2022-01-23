import 'package:dr_dent/Src/bloc/model/comment_model.dart';
import 'package:dr_dent/Src/bloc/model/post_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_offers_repository.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Controller/like_comment_controller.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Controller/socail_controller.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Repository/add_comment_repository.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/repository/post_comments_repository.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/repository/social_repository.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PostCommentsController extends GetxController{
  RequestStatus status = RequestStatus.initial;

  late TextEditingController commentController ;

  List<CommentModel> comments = [];

  int id;


  PostCommentsController({required this.id});
  // ========== START FETCH DATA  ====================
  final PostCommentsRepository _postCommentsRepository = PostCommentsRepository();
  Future<void> fetchComments()async{
    status = RequestStatus.loading;
    update();
    var response = await _postCommentsRepository.fetchPostComments(postId: id);
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      if(response.data['data']!=null){
        comments.clear();
        for (var item in response.data['data']) {
          comments.add(CommentModel.fromJson(item));
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



  final AddCommentRepository _addCommentRepository = AddCommentRepository();
  Future<void> addComment()async{
    if(commentController.text.isNotEmpty){
      setLoading();
      var response = await _addCommentRepository.addComment(postId: id,comment: commentController.text);
      Get.back();
      commentController.clear();
      if (response.statusCode == 200 && response.data["status"] == true) {
        debugPrint("request operation success");
        // _socialController.increasePostCommentCounts(postId: id);
        if(response.data["data"]!=null){
          comments.add(CommentModel.fromJson(response.data["data"]));
          update();
        }
        debugPrint("convert operation success");
      }else{
      }
    }else{

    }
  }



  final LikeCommentController _likeCommentController = Get.put(LikeCommentController());
  Future<void> likeComment({required int commentId})async{
    int postIndex = comments.indexWhere((element) => element.id == commentId);
    _likeCommentController.likeComment(
        onSuccess: (){
          if(comments[postIndex].like==1){
            comments[postIndex].like = 0 ;
            comments[postIndex].likeNumbers = comments[postIndex].likeNumbers !- 1;

          }else{
            comments[postIndex].like = 1 ;
            comments[postIndex].likeNumbers = comments[postIndex].likeNumbers !+ 1 ;
          }
          update();
        },
        commentId: commentId
    );
  }






  @override
  void onInit() {
    super.onInit();
    commentController = TextEditingController();
    fetchComments();
  }

}
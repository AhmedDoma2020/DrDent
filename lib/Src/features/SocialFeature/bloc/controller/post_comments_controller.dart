import 'package:dr_dent/Src/bloc/model/comment_model.dart';
import 'package:dr_dent/Src/bloc/model/post_model.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_offers_repository.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/repository/post_comments_repository.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/repository/social_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PostCommentsController extends GetxController{
  RequestStatus status = RequestStatus.initial;

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





  @override
  void onInit() {
    super.onInit();
    fetchComments();
  }

}
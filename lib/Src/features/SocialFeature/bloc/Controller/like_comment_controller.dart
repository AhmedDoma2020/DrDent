import 'package:dr_dent/Src/bloc/model/comment_model.dart';
import 'package:dr_dent/Src/bloc/model/post_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_offers_repository.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Repository/like_comment_repository.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Repository/like_post_repository.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/repository/post_comments_repository.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/repository/social_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LikeCommentController extends GetxController{
  RequestStatus status = RequestStatus.initial;

  // ========== START FETCH DATA  ====================
  final LikeCommentRepository _likeCommentRepository = LikeCommentRepository();
  Future<void> likeComment({required VoidCallback onSuccess,required int commentId})async{
    setLoading();
    var response = await _likeCommentRepository.likeComment(commentId: commentId,);
    Get.back();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      onSuccess();
      debugPrint("convert operation success");
    }else{
    }
  }
  // ================  END FETCH DATA  ====================

}
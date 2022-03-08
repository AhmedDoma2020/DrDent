import 'dart:convert';
import 'dart:io';

import 'package:dr_dent/Src/bloc/model/item_of_share_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Controller/socail_controller.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Repository/add_post_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

import '../../../../bloc/model/post_model.dart';
import '../Repository/delete_post_repo.dart';
import '../Repository/edit_post_repo.dart';

class DeletePostController extends GetxController  {


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
        customSnackBar(title: response.data["message"]??"");
        debugPrint("convert operation success");
        update();
      } else {
        debugPrint('response in add post is $response');
        customSnackBar(title: response.data["message"]??"");
        update();
      }

  }
}

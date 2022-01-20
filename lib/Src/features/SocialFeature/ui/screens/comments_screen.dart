import 'package:dr_dent/Src/bloc/model/post_model.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/controller/post_comments_controller.dart';
import 'package:dr_dent/Src/features/SocialFeature/ui/widgets/comment_widget.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';


class CommentsScreen extends StatelessWidget {
  final PostModel post;
  const CommentsScreen({Key? key,required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PostCommentsController(id: post.id!));
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'التعليقات'),
      body: GetBuilder<PostCommentsController>(
        builder: (_) =>
            _.status !=RequestStatus.done?
                0.0.ESH():
            ListView.separated(
            itemBuilder: (context, index) => Padding(
              padding:  EdgeInsets.only(
                top: index==0? 16.h : 0
              ),
              child: CommentWidget(comment: _.comments[index],),
            ),
            separatorBuilder: (context, index) => 16.0.ESH(),
            itemCount: _.comments.length,
            shrinkWrap: true,
        ),
      ),
    );
  }
}

import 'package:dr_dent/Src/bloc/model/post_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Controller/socail_controller.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/controller/post_comments_controller.dart';
import 'package:dr_dent/Src/features/SocialFeature/ui/widgets/comment_widget.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
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
    var node = FocusScope.of(context);
    Get.put(PostCommentsController(id: post.id!));
    // SocialController _socialController = Get.find();
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'التعليقات'),
      body: GetBuilder<PostCommentsController>(
        builder: (_) =>
           Stack(
             children: [
               _.status !=RequestStatus.done?
               0.0.ESH():
               ListView.separated(
                 itemBuilder: (context, index) => Padding(
                   padding:  EdgeInsets.only(
                       top: index==0? 16.h : 0
                   ),
                   child: CommentWidget(comment: _.comments[index],
                     onLike: (){_.likeComment(commentId:_.comments[index].id!);},),
                 ),
                 separatorBuilder: (context, index) => 16.0.ESH(),
                 itemCount: _.comments.length,
                 shrinkWrap: true,
               ),
               Align(
                 alignment: Alignment.bottomCenter,
                 child: Container(
                   color: Colors.white,
                   width: double.infinity,
                   height: 80.h,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Padding(
                         padding:  EdgeInsets.symmetric(
                           horizontal: 16.w
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             SizedBox(
                               width: 310.w,
                               child: TextFieldDefault(
                                 verticalPadding: 0,
                                 hint: 'اكتب تعليقا',
                                 fieldType: FieldType.WithBorder,
                                 controller: _.commentController,
                               ),
                             ),
                             Expanded(
                               child: GestureDetector(
                                 onTap: (){
                                   node.unfocus();
                                   _.addComment();
                                 },
                                 child: Container(
                                   child: Icon(
                                     Icons.send,
                                     color: kCMainGrey,
                                     size: 24.h,
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
             ],
           ),
      ),
    );
  }
}

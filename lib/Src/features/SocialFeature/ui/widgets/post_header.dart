import 'package:dr_dent/Src/bloc/model/post_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';

class PostHeader extends StatelessWidget {
  final PostModel post;
  final PostType postType;
  final bool small;
  const PostHeader({this.small=false,Key? key,required this.post,this.postType=PostType.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: 24.w
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: small?30.w:40.w,
              height: small?30.w:40.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: ImageNetwork(
                width: small?30.w:40.w,
                height: small?30.w:40.w,
                url: postType==PostType.post?post.ownerImage:post.shareImage
              ),
            ),
            16.0.ESW(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: postType==PostType.post?post.ownerName:post.shareName,
                  color: kCMainBlack2,
                  fontSize: small?12:16,
                  fontW: FW.bold,
                ),
                3.0.ESH(),
                CustomText(
                  text: post.date,
                  color: kCMainBlack2,
                  fontSize: small?9:12,
                  fontW: FW.light,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dr_dent/Src/bloc/model/post_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../screens/add_post_screen.dart';
import '/src/core/utils/extensions.dart';



class PostHeader extends StatelessWidget {
  final PostModel post;

  const PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: ImageNetwork(
                      width: 40.w, height: 40.w, url: post.ownerImage),
                ),
                16.0.ESW(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: post.ownerName,
                      color: kCMainBlack2,
                      fontSize: 16,
                      fontW: FW.bold,
                    ),
                    3.0.ESH(),
                    CustomText(
                      text: post.date,
                      color: kCMainBlack2,
                      fontSize: 12,
                      fontW: FW.light,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
              child: GestureDetector(
                onTap: () {
                  Get.to(()=>AddPostScreen(postModel:post,isEdit:true));
                },
                child: const Icon(
                  Icons.add,
                  color: kCMainLightGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

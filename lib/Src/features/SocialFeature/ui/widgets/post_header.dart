import 'package:dr_dent/Src/bloc/model/post_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Controller/delete_post_controller.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/SocialProfileScreen/View/Screen/social_profile_screen.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:dr_dent/Src/ui/widgets/sheets/sheet_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '/src/core/utils/extensions.dart';
import '../screens/add_post_screen.dart';

class PostHeader extends StatelessWidget {
  final PostModel post;
  final PostType postType;
  final bool small;
  final Function(String?)? onShareEdit;

  const PostHeader({
    this.small = false,
    this.onShareEdit,
    Key? key,
    required this.post,
    this.postType = PostType.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeletePostController _deletePostController =
        Get.put(DeletePostController());
    GetStorage box = GetStorage();
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
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>SocialProfileScreen(userId: post.ownerId!,));
                    },
                    child: Container(
                      width: small ? 30.w : 40.w,
                      height: small ? 30.w : 40.w,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: ImageNetwork(
                          width: small ? 30.w : 40.w,
                          height: small ? 30.w : 40.w,
                          url: postType == PostType.post
                              ? post.ownerImage
                              : post.shareImage),
                    ),
                  ),
                  16.0.ESW(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: postType == PostType.post
                            ? post.ownerName
                            : post.shareName,
                        color: kCMainBlack2,
                        fontSize: small ? 12 : 16,
                        fontW: FW.bold,
                      ),
                      3.0.ESH(),
                      CustomText(
                        text: post.date,
                        color: kCMainBlack2,
                        fontSize: small ? 9 : 12,
                        fontW: FW.light,
                      ),
                    ],
                  ),
                ],
              ),
              post.ownerId == box.read('id') || post.shareId == box.read('id')
                  ? small
                      ? 0.0.ESW()
                      : PopupMenuButton(
                          icon: Icon(Icons.more_vert,
                              color: kCMainBlack, size: 28.h),
                          itemBuilder: (context) => <PopupMenuEntry>[
                            PopupMenuItem(
                              padding: EdgeInsets.symmetric(horizontal: 0.w),
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: ListTile(
                                  onTap: postType == PostType.post
                                      ? () {
                                          Get.back();
                                          Get.to(() => AddPostScreen(
                                              postModel: post, isEdit: true));
                                        }
                                      : () {
                                          Get.back();
                                          Get.bottomSheet(
                                              SheetSharePost(
                                                  onSave: (content) {
                                                    Get.back();
                                                    if (onShareEdit != null) {
                                                      onShareEdit!(content);
                                                    }
                                                  },
                                                  content: post.shareContent!,
                                                  isEdit: true),
                                              isScrollControlled: true);
                                        },
                                  title: CustomText(
                                    text: "Edit_",
                                    fontSize: 16,
                                    color: kCBlackTitle,
                                    fontW: FW.semicond,
                                  ),
                                  leading: const ImageIcon(
                                    AssetImage("assets/icons/edit.png"),
                                    color: kCMainBlack,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              padding: EdgeInsets.symmetric(horizontal: 0.w),
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: ListTile(
                                  onTap: () {
                                    Get.back();
                                    _deletePostController.deletePost(
                                        postId: post.id!);
                                  },
                                  title: CustomText(
                                    text: "Delete_",
                                    fontSize: 16,
                                    color: kCBlackTitle,
                                    fontW: FW.semicond,
                                  ),
                                  leading: const ImageIcon(
                                    AssetImage("assets/icons/delete.png"),
                                    color: kCMainBlack,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                  : 0.0.ESW(),
            ],
          )),
    );
  }
}

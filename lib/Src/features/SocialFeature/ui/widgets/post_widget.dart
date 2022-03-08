// import 'package:dr_dent/Src/bloc/model/post_model.dart';
// import 'package:dr_dent/Src/core/constants/color_constants.dart';
// import 'package:dr_dent/Src/core/services/photo_view.dart';
// import 'package:dr_dent/Src/features/SocialFeature/ui/screens/comments_screen.dart';
// import 'package:dr_dent/Src/features/SocialFeature/ui/widgets/post_header.dart';
// import 'package:dr_dent/Src/features/SocialFeature/ui/widgets/post_statics.dart';
// import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
// import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '/src/core/utils/extensions.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class MyPostWidget extends StatelessWidget {
//   final PostModel post;
//   final VoidCallback onLike;
//
//
//   const MyPostWidget({Key? key,required this.post,required this.onLike}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color: Colors.white,
//       child: Column(
//         children: [
//           16.0.ESH(),
//           PostHeader(
//             post: post,
//           ),
//           post.images!.isEmpty
//               ? 0.0.ESW()
//               : Padding(
//                   padding: EdgeInsets.only(top: 14.h),
//                   child: GestureDetector(
//                     onTap: () {
//                       Get.to(() => PhotoViewWidget(
//                             imageProvider: NetworkImage(post.images![0]),
//                           ));
//                     },
//                     child: ImageNetwork(
//                         url: post.images![0],
//                         width: double.infinity,
//                         height: 176.h),
//                   ),
//                 ),
//           Container(
//             width: double.infinity,
//             color: kCMainScaffoldGrey,
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
//               child: CustomText(
//                 text: post.content,
//                 fontW: FW.light,
//                 fontSize: 14,
//                 color: kCMainBlack2,
//                 textAlign: TextAlign.start,
//               ),
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             color: Colors.white,
//             height: 50.h,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0.w),
//               child: Row(
//                 children: [
//                   PostStatics(
//                     icon: 'like.png',
//                     count: '${post.likesNumber!}',
//                     onTap: () {
//                       onLike();
//                     },
//                     iconColor: post.like == 1 ? kCMain : kCMainGrey,
//                   ),
//                   30.0.ESW(),
//                   PostStatics(
//                     icon: 'comment.png',
//                     count: '${post.commentsNumber!}',
//                     onTap: () {
//                       Get.to(() => CommentsScreen(
//                             post: post,
//                           ));
//                     },
//                   ),
//                   30.0.ESW(),
//                   PostStatics(icon: 'share.png', count: '${post.shareNumber!}'),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

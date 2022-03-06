import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalPublicationsFeature/bloc/Controller/my_socail_controller.dart';
import 'package:dr_dent/Src/features/SocialFeature/ui/widgets/post_widget.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/EmptyWidget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/src/core/utils/extensions.dart';

class MySocialScreen extends StatelessWidget {
  final int userId ;
  const MySocialScreen({required this.userId ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MySocialController(userId: userId));
    return GetBuilder<MySocialController>(
      builder: (_) => _.status != RequestStatus.done
          ? Center(
              child: Loader(),
            )
          : _.posts.isEmpty
              ? Container(
        height: 300.h,
                color: Colors.teal,
                child: EmptyWidget(
                image: "assets/image/emptyPosts.png",
                onTapButton: () {},
                title: 'You_have_not_shared_any_posts_yet'.tr,
                availableButton: false,
                  ),
              )
              : ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => MyPostWidget(
                    post: _.posts[index],
                    onLike: () {
                      _.likePost(postId: _.posts[index].id!);
                    },
                  ),
                  separatorBuilder: (context, index) => 16.0.ESH(),
                  itemCount: _.posts.length,
                  shrinkWrap: true,
                ),
    );
  }
}

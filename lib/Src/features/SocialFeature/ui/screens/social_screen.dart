

import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalPublicationsFeature/ui/widgets/post_widget.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Controller/socail_controller.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';
class SocialScreen extends StatelessWidget {
  const SocialScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Get.put(SocialController());
    final SocialController _socialController = Get.find();
    return GetBuilder<SocialController>(
      builder: (_) =>
          _.status != RequestStatus.done?
              Center(child: Loader(),):
          RefreshIndicator(
            onRefresh: ()async{
              _.fetchSocial();
            },
            child: ListView.separated(
        itemBuilder: (context, index) => PostWidget(
            post: _.posts[index],
            onLike: (){
              _.likePost(postId:_.posts[index].id!);
            },
        ),
        separatorBuilder: (context, index) => 16.0.ESH(),
        itemCount: _.posts.length,
        shrinkWrap: true,
      ),
          ),
    );
  }
}

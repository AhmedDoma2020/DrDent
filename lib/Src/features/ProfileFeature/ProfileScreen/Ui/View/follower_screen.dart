import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Controller/followers_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Ui/Widget/follow_info_row_widget.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/EmptyWidget/empty_widget.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class FollowersScreen extends StatelessWidget {
  final int userId;
  const FollowersScreen({required this.userId, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(FetchFollowersController(userId: userId));
    return Scaffold(
      appBar: AppBars.appBarDefault(title: "followers_", isBack: true),
      body: ListView(
        children: [
          SizedBox(
            height: 600.h,
            width: double.infinity,
            child: GetBuilder<FetchFollowersController>(
              builder: (_) =>  _.status != RequestStatus.done
                  ? Center(child: Loader())
                  : _.followersList.isEmpty?EmptyWidget(image: "assets/image/emptyFollowers.png", onTapButton: (){},availableButton: false,title: "no_following_yet",) : ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => FollowInfoRowWidget(
                    followModel: _.followersList[index],
                    ),
                separatorBuilder: (context, index) => 8.0.ESH(),
                itemCount: _.followersList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

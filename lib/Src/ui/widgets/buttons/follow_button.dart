import 'package:dr_dent/Src/bloc/controller/follow_and_un_follow_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button_default.dart';


class FollowButton extends StatefulWidget {
  int isFollow;
  final int userId;
  final Function onTap;

  FollowButton({
    required this.isFollow,
    required this.userId,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  @override
  Widget build(BuildContext context) {
    FollowAndUnFollowController _followAndUnFollowController = Get.put(FollowAndUnFollowController());

    return GetBuilder<FollowAndUnFollowController>(builder: (_) => ButtonDefault(
        title: widget.isFollow == 0 ? 'follow_' : "un_follow",
        iconImage: "blockProfile.png",
        isLoading: _.isLoading,
        height: 30,
        width: 96,
        radius: 4,
        titleSize: 12,
        onTap: () {
          Get.closeAllSnackbars();
          // widget.onTap(widget.isFollow);
          _.followAndUnFollow(
              userId: widget.userId, onSuccess: () {
            setState(() {
              widget.isFollow = widget.isFollow == 1 ? 0 : 1;
            });
          });
        },
      ),
    );
  }
}

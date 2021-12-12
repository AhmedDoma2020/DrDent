import 'package:dr_dent/Src/ui/widgets/EmptyWidget/empty_widget.dart';
import 'package:flutter/material.dart';

class WattingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: EmptyWidget(
          image: "assets/image/emptyWatting.png",
          title: "status_waiting_title",
          subTitle: "status_waiting_sub_title",
          availableButton: false,
          onTapButton: () {},
        ),
      ),
    );
  }
}

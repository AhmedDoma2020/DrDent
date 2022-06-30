import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '/src/ui/widgets/GeneralWidgets/empty_widget_full_screen.dart';

class OrderCancelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmptyWidgetFullScreen(
        topPadding: 190,
        image: "assets/image/cancel.png",
        imageH: 160,
        imageW: 160,
        title: "cancel_order_success",
        subTitle: "",
        titleButton: "Back_to_home",
        onTapButton: (){},

      ),
    );
  }
}


import 'package:dr_dent/Src/features/SocialFeature/ui/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import '/src/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => PostWidget(),
      separatorBuilder: (context, index) => 16.0.ESH(),
      itemCount: 30,
      shrinkWrap: true,
    );
  }
}

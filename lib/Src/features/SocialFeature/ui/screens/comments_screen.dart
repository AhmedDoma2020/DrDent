import 'package:dr_dent/Src/features/SocialFeature/ui/widgets/comment_widget.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';


class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'التعليقات'),
      body: ListView.separated(
          itemBuilder: (context, index) => Padding(
            padding:  EdgeInsets.only(
              top: index==0? 16.h : 0
            ),
            child: CommentWidget(),
          ),
          separatorBuilder: (context, index) => 16.0.ESH(),
          itemCount: 30,
          shrinkWrap: true,
      ),
    );
  }
}

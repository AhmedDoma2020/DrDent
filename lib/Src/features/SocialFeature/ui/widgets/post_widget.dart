import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/SocialFeature/ui/widgets/post_header.dart';
import 'package:dr_dent/Src/features/SocialFeature/ui/widgets/post_statics.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import '/src/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          PostHeader(),
          Padding(
            padding:  EdgeInsets.only(
              top: 14.h
            ),
            child: ImageNetwork(
                url: 'https://images.pexels.com/photos/6149104/pexels-photo-6149104.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                width: double.infinity,
                height: 176.h
            ),
          ),
          Container(
            width: double.infinity,
            color: kCMainScaffoldGrey,
            child: Padding(
              padding:  EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 24.w
              ),
              child: CustomText(
                text: 'المؤتمر السنوي للشركات الطبية لعرض أسعار المنتجات ومتطلبات المجتمع الطبي',
                fontW: FW.light,
                fontSize: 14,
                color: kCMainBlack2,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            height: 50.h,
            child: Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 16.0.w
              ),
              child: Row(
                children: [
                   const PostStatics(icon: 'like.png', count: '5'),
                   30.0.ESW(),
                   const PostStatics(icon: 'comment.png', count: '56'),
                   30.0.ESW(),
                   const PostStatics(icon: 'share.png', count: '30'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Controller/add_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/services/photo_view.dart';
import '../../../../ui/widgets/GeneralWidgets/image_network.dart';

class AddImagePostForm extends StatelessWidget {
  final String futureImage ;
  const AddImagePostForm({
    this.futureImage ='',
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint('futureImage is $futureImage');
    return GetBuilder<AddPostController>(
      builder:(_) =>  Stack(
        children: [
          Container(
            width: double.infinity,
            height: 320.h,
            color: Colors.white,
            child: futureImage == null || futureImage == ""?
            _.image != null
                ? Image.file(
                    _.image!,
                    fit: BoxFit.cover,
                    height: 80.w,
                    width: 80.w,
                  )
                : 0.0.ESH():GestureDetector(
              onTap: () {
                Get.to(() => PhotoViewWidget(imageProvider: NetworkImage(futureImage),));
              },
              child: ImageNetwork(
                url: futureImage,
                height: double.infinity,
                width: double.infinity,
                boxFit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 24.h,
            left: 24.w,
            width: 24.w,
            child: GestureDetector(
              onTap: (){
                debugPrint("close");
                _.changeImageVal(null);
                _.setFuturePostImage='';
              },
              child: Container(
                height: 24.w,
                width: 24.w,
                decoration: BoxDecoration(
                  color: kCMainGrey,
                  borderRadius: BorderRadius.circular(777.r),
                ),
                child: Center(child: Icon(Icons.clear,color: Colors.white,size: 14.w,)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

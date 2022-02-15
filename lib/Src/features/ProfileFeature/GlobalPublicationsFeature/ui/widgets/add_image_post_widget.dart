import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Controller/add_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddImagePostForm extends StatelessWidget {
  const AddImagePostForm({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPostController>(
      builder:(_) =>  Stack(
        children: [
          Container(
            width: double.infinity,
            height: 320.h,
            color: Colors.white,
            child: _.image != null
                ? Image.file(
                    _.image!,
                    fit: BoxFit.cover,
                    height: 80.w,
                    width: 80.w,
                  )
                : 0.0.ESH(),
          ),
          Positioned(
            top: 24.h,
            left: 24.w,
            width: 24.w,
            child: GestureDetector(
              onTap: (){
                debugPrint("close");
                _.changeImageVal(null);
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


import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Controller/add_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class AddMediaButtonBarForm extends StatelessWidget {
  const AddMediaButtonBarForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPostController>(
      builder:(_) => Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 60.h,
          width: double.infinity,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: (){
                  _.getImage();
                },
                child: Container(
                  height: 60.h,
                  width: 60.h,
                  color: Colors.white,
                  child: Center(child: ImageIcon(const AssetImage("assets/icons/gallery.png"),size: 24.h,color: kCMainGrey,)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




import 'dart:io';

import 'package:dr_dent/Src/core/services/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageFormForm extends StatelessWidget {
  final XFile image;
  final VoidCallback onDelete;

  const ImageFormForm({
    required this.image,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        height: 124.h,
        width: 124.w,
        color: Colors.grey.withOpacity(0.5),
        child: Stack(
          children: [
            Center(
              child: GestureDetector(
                  onTap: (){
                    // Get.to(() => PhotoViewWidget(imageProvider: NetworkImage(image),));
                  },
                  child: Image.file(File(image.path)
                  )),
            ),
            Positioned(
              top: 8.h,
              left: 8.w,
              // right: 16.w,
              child: GestureDetector(
                onTap: onDelete,
                child: CircleAvatar(
                    backgroundColor: Colors.black45,
                    radius: 16.r,
                    child: Icon(
                      Icons.close_outlined,
                      color: Colors.white,
                      size: 20.h,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

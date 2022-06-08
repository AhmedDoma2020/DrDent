import 'dart:io';

import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ImageFormForm extends StatelessWidget {
  var image;
  final VoidCallback onDelete;

  ImageFormForm({
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
                onTap: () {
                  // Get.to(() => PhotoViewWidget(imageProvider: NetworkImage(image),));
                },
                child:
                image.runtimeType != String?
                Image.file(
                  File(image.path),
                  fit: BoxFit.cover,
                  height: 124.h,
                  width: 124.w,
                ):
                ImageNetwork(
                  height:double.infinity ,
                  width: double.infinity,
                  url: image,
                  boxFit: BoxFit.cover,
                ),
              ),
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


class FeatureImageForm extends StatelessWidget {
  final String image;
  final VoidCallback onDelete;

  const FeatureImageForm({
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
                onTap: () {
                  // Get.to(() => PhotoViewWidget(imageProvider: NetworkImage(image),));
                },
                child:ImageNetwork(
                  height:double.infinity ,
                  width: double.infinity,
                  url: image,
                  boxFit: BoxFit.cover,
                ),
              ),
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

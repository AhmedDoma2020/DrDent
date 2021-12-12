import 'dart:io';

import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({
    Key? key,
  }) : super(key: key);

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  File? image;

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print("field picked image $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "A_picture_of_the_clinic_or_center".tr,
          fontSize: 14,
          fontW: FW.semibold,
        ),
        20.0.ESH(),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            height: 100.h,
            width: 143.w,
            color: kCBGTextFormFiled,
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                      height: image != null ? double.infinity : 24.w,
                      width: image != null ? double.infinity : 24.w,
                      child: image != null
                          ? Image.file(
                              image!,
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            )
                          : Image.asset(
                              "assets/icons/addImage.png",
                              height: 24.w,
                              width: 24.w,
                            )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h, left: 8.w),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        if (image != null) {
                         setState(() {
                           image = null;
                         });
                        } else {
                          getImage();
                        }
                      },
                      child: CircleAvatar(
                        radius: 18.r,
                        backgroundColor: kCMain,
                        child: Icon(image != null ? Icons.clear : Icons.add,
                            color: Colors.white, size: 10.w),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

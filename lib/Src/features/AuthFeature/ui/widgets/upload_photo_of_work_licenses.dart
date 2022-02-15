import 'dart:convert';
import 'dart:io';

import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/services/photo_view.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotoContainer extends StatefulWidget {
  final Function(String) onTap;
  String futureImage;
  final String title;

  UploadPhotoContainer({
    required this.onTap,
    required this.title,
    this.futureImage = "",
    Key? key,
  }) : super(key: key);

  @override
  State<UploadPhotoContainer> createState() => _UploadPhotoContainerState();
}

class _UploadPhotoContainerState extends State<UploadPhotoContainer> {
  File? image;
  String? img64;

  Future setImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
      final bytes = File(image.path).readAsBytesSync();
      img64 = base64Encode(bytes);
      debugPrint("image selected successfulye");
      widget.onTap(img64!);
    } on PlatformException catch (e) {
      debugPrint("field picked image $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("futureImage is ${widget.futureImage}");
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: widget.title.tr,
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
                    height: image != null || widget.futureImage != ""
                        ? double.infinity
                        : 24.w,
                    width: image != null || widget.futureImage != ""
                        ? double.infinity
                        : 24.w,
                    child:
                        widget.futureImage == null || widget.futureImage == ""
                            ? image != null
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
                                  )
                            : GestureDetector(
                                onTap: () {
                                  Get.to(() => PhotoViewWidget(imageProvider: NetworkImage(widget.futureImage),));
                                },
                                child: ImageNetwork(
                                  url: widget.futureImage,
                                  height: double.infinity,
                                  width: double.infinity,
                                  boxFit: BoxFit.fill,
                                ),
                              ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h, left: 8.w),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        if (image != null || widget.futureImage != "") {
                          setState(() {
                            image = null;
                            img64 = null;
                            widget.futureImage = "";
                            widget.onTap("");
                          });
                        } else {
                          debugPrint("on tap setImage fun");
                          setImage();
                        }
                      },
                      child: CircleAvatar(
                        radius: 18.r,
                        backgroundColor: kCMain,
                        child: Icon(
                            image != null || widget.futureImage != ""
                                ? Icons.clear
                                : Icons.add,
                            color: Colors.white,
                            size: 10.w),
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

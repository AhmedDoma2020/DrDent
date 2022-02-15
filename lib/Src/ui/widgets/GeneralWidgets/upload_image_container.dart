import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/services/photo_view.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'image_network.dart';


class UploadImageContainer extends StatefulWidget {
  final Function(String) onImageSelected;
  String futureImage;

   UploadImageContainer({
    required this.onImageSelected ,
    this.futureImage = "",
    Key? key,
  }) : super(key: key);

  @override
  State<UploadImageContainer> createState() => _UploadImageContainerState();
}
class _UploadImageContainerState extends State<UploadImageContainer> {
  File? image;
  String? logImg64;

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
      final bytes = File(image.path).readAsBytesSync();
      logImg64 = base64Encode(bytes);
      widget.onImageSelected( logImg64!);
    } on PlatformException catch (e) {
      debugPrint("field picked image $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    debugPrint("futureLogAndTaxImage is ${widget.futureImage}");
    return Container(
      width: double.infinity,
      height: 188.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: kCSubMain,
          width: 1.w,
        ),
      ),
      child:
      image != null || widget.futureImage != ""
          ? Stack(
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) =>
              //           PhotoViewWidget(
              //             imageProvider: AssetImage(),
              //           ),
              //     ));
            },
            child:
             widget.futureImage != ""?
            GestureDetector(
              onTap: () {
                Get.to(() => PhotoViewWidget(
                  imageProvider:
                  NetworkImage(widget.futureImage),
                ));
              },
              child: ImageNetwork(
                url: widget.futureImage,
                height: double.infinity,
                width: double.infinity,
                boxFit: BoxFit.fill,
              ),
            ):
            Image.file(
              image!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 188.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h, left: 8.w),
            child: Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () {
                  setState(() {
                    image = null;
                    logImg64 = null;
                    widget.futureImage = "";
                    widget.onImageSelected('');
                    debugPrint("image after deleted is $image");
                    debugPrint("futureImage after deleted is ${widget.futureImage}");
                  });
                },
                child: Container(
                  height: 24.w,
                  width: 24.w,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(777.r),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 16.w,
                  ),
                ),
              ),
            ),
          ),
        ],
      )
          :
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 24.w,
            width: 24.w,
            child: Image.asset(
              "assets/icons/uplode.png",
              height: 24.w,
              width: 24.w,
            ),
          ),
          24.0.ESH(),
          ButtonDefault(
            width: 125,
            height: 48,
            buttonColor: kCSubMain,
            title: 'uplode_'.tr,
            radius: 4,
            titleColor: Colors.white,
            onTap: () {
              getImage();
            },
          ),
        ],
      ),
    );
  }
}

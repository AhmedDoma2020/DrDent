import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/services/photo_view.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../ui/widgets/GeneralWidgets/image_network.dart';


class AttachYourCVIWidget extends StatefulWidget {
  final Function(String) onTap;
   String futureImage;

   AttachYourCVIWidget({
    required this.onTap,
    this.futureImage = "",
    Key? key,
  }) : super(key: key);
  @override
  State<AttachYourCVIWidget> createState() => _AttachYourCVIWidgetState();
}
class _AttachYourCVIWidgetState extends State<AttachYourCVIWidget> {
  File? image;
  String? img64;
  Uint8List? bytes2;
  String? photoView;

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
      final bytes = File(image.path).readAsBytesSync();
      img64 = base64Encode(bytes);
      bytes2 = const Base64Decoder().convert(img64!);
      widget.onTap(img64!);
    } on PlatformException catch (e) {
      debugPrint("field picked image $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    debugPrint('futureImage in build is ${widget.futureImage}');
    return InkWell(
      onTap: (){
        debugPrint("aaaaaaaaaaaaaaaaaa");
        getImage();
      },
      child: Container(
        width: double.infinity,
        height: 82.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: kCSubMain.withOpacity(0.05),
          border: Border.all(
            color: kCSubMain,
            width: 1.w,
          ),
        ),
        child:
        image != null || widget.futureImage != ''
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child:  image != null?
                Image.file(
                  image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 82.h,
                ):GestureDetector(
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
                    setState(() {
                      image = null;
                      img64 = null;
                      widget.onTap("");
                      widget.futureImage ='';
                    });
                  },
                  child: Container(
                    height: 24.w,
                    width: 24.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(777.r),
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
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 18.w,
              width: 18.w,
              child: Image.asset(
                "assets/icons/uplode.png",
                height: 18.w,
                width: 18.w,
              ),
            ),
            8.0.ESH(),
           CustomText(text: "attach_your_CV".tr,fontSize: 12,fontW: FW.light,),
          ],
        ),
      ),
    );
  }
}

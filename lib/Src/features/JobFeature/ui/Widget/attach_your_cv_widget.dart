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


class AttachYourCVIWidget extends StatefulWidget {
  final Function(String) onTap;
  const AttachYourCVIWidget({
    required this.onTap ,
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
      print("field picked image $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: image != null
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
              child: Image.file(
                image!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 82.h,
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
          : GestureDetector(
        onTap: (){
          getImage();
          print("aaaaaaaaaaaaaaaaaaaaaa");
        },
            child: Column(
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
         CustomText(text: "ارفاق السيرة الذاتية",fontSize: 12,fontW: FW.light,),
        ],
      ),
          ),
    );
  }
}

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/services/photo_view.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'wating_screen.dart';

class BusinessLicenseScreen extends StatefulWidget {
  @override
  State<BusinessLicenseScreen> createState() => _BusinessLicenseScreenState();
}

class _BusinessLicenseScreenState extends State<BusinessLicenseScreen> {
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
    } on PlatformException catch (e) {
      print("field picked image $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
            AppBars.appBarDefault(title: "business_license".tr, isBack: false),
        backgroundColor: Colors.white,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "business_license".tr,
                      fontSize: 18,
                      fontW: FW.semibold,
                    ),
                    16.0.ESH(),
                    CustomText(
                      text: "business_license_sup_title".tr,
                      fontSize: 16,
                      fontW: FW.semibold,
                      color: kCGreyTitle,
                    ),
                    62.0.ESH(),
                    Container(
                      width: double.infinity,
                      height: 188.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kCSubMain,
                          width: 1.w,
                        ),
                      ),
                      child: image != null
                          ? Stack(
                            children: [
                              GestureDetector(
                        onTap: (){
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           PhotoViewWidget(
                              //             imageProvider: AssetImage(),
                              //           ),
                              //     ));
                        },
                                child: Image.file(
                                    image!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 188.h,
                                  ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top: 8.h,left: 8.w),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        image=null;
                                      });
                                    },
                                    child: Container(
                                      height:24.w,
                                      width: 24.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(777.r),
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                      child: Icon(Icons.clear,color: Colors.white,size:16.w,),
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
                                  width: 125.w,
                                  height: 36,
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
                    ),
                  ],
                ),
                image==null? 0.0.ESH():
                ButtonDefault(
                  title: 'save_contain'.tr,
                  onTap: () {
                    Get.to(()=>WattingScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

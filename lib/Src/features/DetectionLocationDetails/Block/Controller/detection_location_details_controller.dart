

import 'package:dr_dent/Src/features/AuthFeature/ui/screens/forget_password_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/account_type_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';


class DetectionLocationDetailsController extends GetxController{

  TextEditingController? phone1Controller;
  TextEditingController? phone2Controller;
  TextEditingController? nameController;
  TextEditingController? priceExaminationController;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  void submit() async{
    if(globalKey.currentState!.validate()){
      globalKey.currentState!.save();
      // setLoadingDialog();
      print('my phone is ${phone1Controller!.value.text}');
      print('my phone is ${priceExaminationController!.value.text}');
      String phone = phone1Controller!.value.text;
      if(phone1Controller!.value.text.isNotEmpty){
        if(phone1Controller!.value.text.startsWith('0')){
          phone = phone1Controller!.value.text.replaceFirst('0','');
        }
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    phone1Controller = TextEditingController();
    phone2Controller = TextEditingController();
    nameController = TextEditingController();
    priceExaminationController = TextEditingController();
  }


  @override
  void dispose() {
    phone1Controller?.dispose();
    phone2Controller?.dispose();
    nameController?.dispose();
    priceExaminationController?.dispose();
    super.dispose();
  }


  File? _image;
  File? get image => _image;
  set setImage(File value) {
    _image = value;
  }
  set setNullImage(Null value) {
    _image = value;
  }
  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      _image = imageTemporary;
      update();
    } on PlatformException catch (e) {
      print("field picked image $e");
    }
  }
}
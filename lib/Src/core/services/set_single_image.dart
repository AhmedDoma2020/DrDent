import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


File? imageFile;
String? img64;
// Uint8List? bytes2;
String? photoView;

Future getImage() async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    imageFile = imageTemporary;
    final bytes = File(image.path).readAsBytesSync();
    img64 = base64Encode(bytes);
    // bytes2 = const Base64Decoder().convert(img64!);
  } on PlatformException catch (e) {
    debugPrint("field picked image $e");
  }
}
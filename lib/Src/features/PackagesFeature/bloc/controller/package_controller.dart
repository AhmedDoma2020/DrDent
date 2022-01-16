import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PackageController extends GetxController{
  late PageController pageController;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController = PageController(initialPage: 0,viewportFraction: .8,keepPage: true);
  }
}
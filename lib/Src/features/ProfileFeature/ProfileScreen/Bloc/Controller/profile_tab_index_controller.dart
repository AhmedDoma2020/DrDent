


import 'package:get/get.dart';

class ProfileTapIndexController extends GetxController{
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int value) {
    _tabIndex = value;
    update();
  }
}

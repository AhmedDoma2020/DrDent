

import 'package:dr_dent/Src/bloc/model/onboarding_item.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';



class OnBoardingController extends GetxController{

  List<OnBoardingItem> boards=[];
  PageController? pageController;
  int boardIndex=0;
  bool isFinal = false;

  void changeBoardIndex(index){
    boardIndex = index;
    if(boardIndex == boards.length-1) {
      isFinal = true;
    } else {
      isFinal = false;
    }
    update();
    debugPrint("boardIndex in changeBoardIndex is $boardIndex");
  }


  void onNext(){
    int jumpTo;
    if(boardIndex < boards.length-1){
      jumpTo = boardIndex + 1;
    }else{
      jumpTo=0;
    }
    pageController!.nextPage(duration: Duration(seconds: 1),curve: Curves.elasticInOut);
    boardIndex = jumpTo;
    debugPrint("boardIndex in onNext is $boardIndex");
    update();
    if(boardIndex == boards.length-1) {
      isFinal = true;
    } else {
      isFinal = false;
    }
    update();
  }

  void onSkip(){
    // Get.offAll(()=>WelcomeScreen());
  }

  void onStartButton(){
    Get.offAll(()=>LoginScreen());
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    boards = boardData;
    boardIndex=0;
    update();
  }

}
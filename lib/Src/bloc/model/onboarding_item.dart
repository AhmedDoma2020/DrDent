import 'package:get/get.dart';
class OnBoardingItem{
  int id;
  String title;
  String subtitle;
  String image;

  OnBoardingItem({this.id=0, this.title='', this.subtitle='', this.image=''});
}


List<OnBoardingItem> boardData = [
  OnBoardingItem(
      id: 0,
      title: 'onBoarding_title_1'.tr,
      subtitle: 'onBoarding_sup_title_1'.tr,
      image: 'board0.png'
  ),
  OnBoardingItem(
      id: 1,
      title: 'onBoarding_title_2'.tr,
      subtitle: 'onBoarding_sup_title_2'.tr,
      image: 'board1.png'
  ),
  OnBoardingItem(
      id: 2,
      title: 'onBoarding_title_3'.tr,
      subtitle: 'onBoarding_sup_title_3'.tr,
      image: 'board2.png'
  ),
  OnBoardingItem(
      id: 3,
      title: 'onBoarding_title_4'.tr,
      subtitle: 'onBoarding_sup_title_4'.tr,
      image: 'board3.png'
  ),
];
import 'package:dr_dent/Src/features/HomeFeature/ui/widgets/home_item.dart';
import 'package:get/get.dart';


class HomeModel{
  late final String title;
  late final String subtitle;
  late final String icon;
  late final int id;

  HomeModel({required this.title,required this.subtitle,required this.icon,required this.id});
}


List<HomeModel> homeModelExamples = [
  HomeModel(
    id: 1,
    icon: 'home1.png',
    title: 'jobs'.tr,
    subtitle: 'هذا مثال يمكن ان يتم استبداله باي عنوان اخر ف اي لحظه ممكنه'
  ),
  HomeModel(
      id: 3,
      icon: 'home1.png',
      title: 'social_media'.tr,
      subtitle: 'هذا مثال يمكن ان يتم استبداله باي عنوان اخر ف اي لحظه ممكنه'
  ),
  HomeModel(
      id: 4,
      icon: 'home1.png',
        title: 'medical_products'.tr,
      subtitle: 'هذا مثال يمكن ان يتم استبداله باي عنوان اخر ف اي لحظه ممكنه'
  ),
];
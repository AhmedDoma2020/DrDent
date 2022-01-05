import 'package:dr_dent/Src/ui/widgets/EmptyWidget/empty_widget.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/lists/list_card_product_rect.dart';
import 'package:dr_dent/Src/ui/widgets/lists/list_job_offer.dart';
import 'package:flutter/material.dart';

class SavedProducts extends StatelessWidget {
  const SavedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'قائمة المحفوظات'),
      body:

      EmptyWidget(
        onTapButton: () {  },
        image: 'assets/icons/emp.png',
        title: ' ! لا يوجد لديك قائمة مفضلات لعرضها',
        availableButton: false,
      ),
      // ListCardProductRect(),
    );
  }
}

import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/ui/widgets/EmptyWidget/empty_widget.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/lists/list_card_product_rect.dart';
import 'package:dr_dent/Src/ui/widgets/lists/list_job_offer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../ui/widgets/Dialog/loading_dialog.dart';
import '../../bloc/controller/saved_products_controller.dart';

class SavedProducts extends StatelessWidget {
  const SavedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SavedProductsController());
    return GetBuilder<SavedProductsController>(
      builder: (_) => Scaffold(
        appBar: AppBars.appBarDefault(title: 'قائمة المحفوظات'),
        body:
            _.status != RequestStatus.done?
            Center(child: Loader(),):
                _.products.isEmpty?
        EmptyWidget(
          onTapButton: () {  },
          image: 'assets/icons/emp.png',
          title: ' ! لا يوجد لديك قائمة مفضلات لعرضها',
          availableButton: false,
        ):
        ListCardProductRect(products: _.products,onLike: (id,status){_.handleLikeProduct(id: id, status: status);}),
      ),
    );
  }
}

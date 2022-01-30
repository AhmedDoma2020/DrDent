import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Controller/fetch_available_insurances_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Controller/fetch_my_services_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Ui/Widget/row_my_services_form.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/EmptyWidget/empty_widget.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'add_services_sheet.dart';

class MyServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FetchMyServicesController _FetchMyServicesController = Get.put(FetchMyServicesController());
    Get.put(FetchAvailableInsurancesController());
    Future<void> onRefresh() async {
      await _FetchMyServicesController.fetchMyServices();
    }
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 24.w,
          ),
          onPressed: () {
            Get.bottomSheet(AddServicesSheet(), isScrollControlled: true);
          },
          backgroundColor: kCMain,
        ),
        appBar: AppBars.appBarDefault(
            title: "my_services".tr,
            onTap: () {
              Get.back();
            }),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: GetBuilder<FetchMyServicesController>(
              builder: (_) => _.status == RequestStatus.loading
                  ? Center(child: Loader())
                  : _.myServicesList.isEmpty
                      ? EmptyWidget(
                          image: "assets/image/emptyServices.png",
                          onTapButton: () {},
                          availableButton: false,
                          title: "empty_services_title".tr,
                          imageH: 160,
                          imageW: 140,
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => RowMyServiceForm(
                            onDeleteTap: () {
                              _.deleteInsurances(
                                  servicesId: _.myServicesList[index].id,
                                  index: index);
                            },
                            onEditTap: () {},
                            service: _.myServicesList[index],
                          ),
                          separatorBuilder: (context, index) => 16.0.ESH(),
                          itemCount: _.myServicesList.length,
                        ),
            ),
          ),
        ),
      ),
    );
  }
}

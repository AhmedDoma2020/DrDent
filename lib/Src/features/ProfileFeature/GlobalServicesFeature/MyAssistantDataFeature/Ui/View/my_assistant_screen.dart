import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyAssistantDataFeature/Bloc/Controller/fetch_my_assistant_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyAssistantDataFeature/Ui/Widget/my_assistant_row_form.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyAssistantDataFeature/Bloc/Controller/fetch_my_assistant_controller.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/EmptyWidget/empty_widget.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'add_assistant_sheet.dart';

class MyAssistantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        Get.put(FetchMyAssistantController());
    Future<void> onRefresh() async {}
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 24.w,
          ),
          onPressed: () {
            Get.bottomSheet(AddAssistantSheet(),isScrollControlled: true);
          },
          backgroundColor: kCMain,
        ),
        appBar: AppBars.appBarDefault(
            title: "assistant_data".tr,
            onTap: () {
              Get.back();
            }),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: GetBuilder<FetchMyAssistantController>(
            builder: (_) =>_.status== RequestStatus.loading? Center(child: Loader(),): _.myAssistantList.isEmpty
                ? EmptyWidget(
                    image: "assets/image/emptyAssistant.png",
                    onTapButton: () {},
                    availableButton: false,
                    title: "empty_assistant_title".tr,
                    imageH: 124,
                    imageW: 200,
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => MyAssistantRow(
                      assistant: _.myAssistantList[index],
                      onEditTap: () {
                        Get.bottomSheet(AddAssistantSheet(
                          isEdit: true,
                          id:  _.myAssistantList[index].id,
                          name:  _.myAssistantList[index].name,
                          phone:  _.myAssistantList[index].phone,
                        ),isScrollControlled: true);
                      },
                      onDeleteTap: _.snackBarStatus == SnackbarStatus.CLOSED? () {
                        _.deleteAssistant(assistantId: _.myAssistantList[index].id,);
                      }:(){},
                    ),
                    separatorBuilder: (context, index) => 16.0.ESH(),
                    itemCount: _.myAssistantList.length,
                  ),
          ),
        ),
      ),
    );
  }
}

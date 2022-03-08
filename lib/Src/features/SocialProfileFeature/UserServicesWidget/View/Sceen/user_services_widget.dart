import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/UserServicesWidget/Bolc/Controller/featch_user_services_controller.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/UserServicesWidget/Bolc/Controller/featch_user_work_spaces_controller.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/UserServicesWidget/View/Widget/user_services_item.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'list_of_work_space_widget.dart';

class UserServicesWidget extends StatelessWidget {
  final int userId;

  const UserServicesWidget({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FetchUserServicesController(userId: userId));
    Get.put(FetchUserWorkSpacesController(userId: userId));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            // color: Colors.amber,
            height: 104.h,
            // width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: GetBuilder<FetchUserServicesController>(
                builder: (_) => _.status ==  RequestStatus.loading?Center(child: Loader(),) : _.userServiceModel.isEmpty ?0.0.ESW(): Row(children: [
                  16.0.ESW(),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => UserServicesItem(
                      userServiceModel: _.userServiceModel[index],
                    ),
                    separatorBuilder: (context, index) => 16.0.ESW(),
                    itemCount: _.userServiceModel.length,
                  ),
                  16.0.ESW(),
                ]),
              ),
            ),
          ),
        ),
        16.0.ESH(),
        GetBuilder<FetchUserWorkSpacesController>(
          builder: (_) =>_.status ==  RequestStatus.loading?Center(child: Loader(),) : _.userWorkSpaces.isNotEmpty
              ? ListOfWorkSpaces(
                  userWorkSpaceModel: _.userWorkSpaces,
                )
              : 0.0.ESH(),
        ),
      ],
    );
  }
}

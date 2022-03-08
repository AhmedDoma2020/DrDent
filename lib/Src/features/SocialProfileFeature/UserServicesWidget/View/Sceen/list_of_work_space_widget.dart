import 'package:dr_dent/Src/bloc/model/detection_location_details_model.dart';
import 'package:dr_dent/Src/bloc/model/user_work_space_model.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/UserServicesWidget/Bolc/Controller/featch_user_work_spaces_controller.dart';
import 'package:dr_dent/Src/features/SocialProfileFeature/UserServicesWidget/View/Widget/ite_of_list_of_work_space_widget.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListOfWorkSpaces extends StatelessWidget {
  final List<WorkSpaceDetailsModel> userWorkSpaceModel;
  ListOfWorkSpaces({required this.userWorkSpaceModel});

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomText(
              text: "Doctors_clinics",
              fontW: FW.semicond,
            ),
          ),
          8.0.ESH(),
          SizedBox(
            width: double.infinity,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => ItemListOfWorkSpaces(
                    userWorkSpaceModel: userWorkSpaceModel[index],
                ),
                separatorBuilder: (context, index) => 8.0.ESH(),
                itemCount: userWorkSpaceModel.length),
          ),
        ],
    );
  }
}

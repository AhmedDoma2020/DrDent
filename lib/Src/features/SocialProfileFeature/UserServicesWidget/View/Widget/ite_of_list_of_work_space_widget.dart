import 'package:dr_dent/Src/bloc/model/detection_location_details_model.dart';
import 'package:dr_dent/Src/bloc/model/user_work_space_model.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ItemListOfWorkSpaces extends StatelessWidget {
  final WorkSpaceDetailsModel userWorkSpaceModel;
  const ItemListOfWorkSpaces({
    required this.userWorkSpaceModel,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 4.h),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 48.h,
            width: 48.h,
            child: ImageNetwork(
              url: userWorkSpaceModel.image,
              height: 48,
              width: 48,
            ),
          ),
          8.0.ESW(),
          Column(
            children: [
              SizedBox(
                width: 260.w,
                child: CustomText(text: userWorkSpaceModel.name,fontW: FW.semicond,),
              ),
              4.0.ESW(),
              SizedBox(
                width: 260.w,
                child: CustomText(text: userWorkSpaceModel.address.address,fontW: FW.semicond,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

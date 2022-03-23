import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_offer.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/screens/job_screen.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../GeneralWidgets/image_network.dart';
import '/src/core/utils/extensions.dart';
import 'card_tag.dart';

class CardJobOffer extends StatelessWidget {
  final JobOffer offer;
  final VoidCallback? onDeleteTap;
  final VoidCallback? onEditTap;
  final bool isMine;
  const CardJobOffer({Key? key,required this.offer,this.onDeleteTap,this.isMine=false,this.onEditTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => JobScreen(
              offer: offer,
            ));
      },
      child: Container(
        width: 343.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 61.w,
                    height: 61.w,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: kCLightGrey.withOpacity(0.5)),
                    child: ImageNetwork(
                      url: offer.image,
                      width: 61.w,
                      height: 61.w,
                    ),
                  ),
                  16.0.ESW(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: offer.description,
                          color: kCMainBlack2,
                          fontSize: 14,
                          fontW: FW.medium,
                          maxLines: 2,
                        ),
                        5.0.ESH(),
                        CustomText(
                          text: offer.name,
                          color: kCActiveDot,
                          fontSize: 10,
                          fontW: FW.light,
                        ),
                        5.0.ESH(),
                        CustomText(
                          text: offer.address,
                          color: kCMainGrey,
                          fontSize: 10,
                          fontW: FW.semicond,
                          maxLines: 2,
                        ),
                        5.0.ESH(),
                        CustomText(
                          text: offer.phone,
                          color: kCMainGrey,
                          fontSize: 10,
                          fontW: FW.semicond,
                        ),
                      ],
                    ),
                  ),
                  isMine?
                  16.0.ESW():0.0.ESH(),
                  isMine?
                  Row(
                    children: [
                      IconWidget(
                        icon: 'assets/icons/edit.png',
                        onEditTap: (){
                          if(onEditTap!=null){
                            onEditTap!();
                          }
                        },
                      ), IconWidget(
                        icon: 'assets/icons/delete.png',
                        onEditTap: (){
                          if(onDeleteTap!=null){
                            onDeleteTap!();
                          }
                        },
                      ),
                    ],
                  ):0.0.ESH(),
                ],
              ),
              15.0.ESH(),
              Divider(),
              15.0.ESH(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   CardTag(
                    title: offer.jobTypeId == 0? 'Full_time':'part_time' ,
                  ),
                  CustomText(
                    text: '${'from_'.tr} ${offer.startSalary} - ${offer.endSalary} ${'E_G_P'.tr}',
                    fontW: FW.demi,
                    fontSize: 14,
                    color: kCMainBlack2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

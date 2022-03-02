import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../GeneralWidgets/edit_widget.dart';
import '/src/core/utils/extensions.dart';
import 'card_tag.dart';

class CardJobRequest extends StatelessWidget {
  final double width;
  final JobRequest request;
  final bool isMine;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  const CardJobRequest({Key? key,this.width=343,required this.request,this.isMine=false,this.onDelete,this.onEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h
        ),
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
                      color: kCLightGrey.withOpacity(0.5)
                  ),
                  child: ImageNetwork(
                    url: request.ownerImage,
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
                        text: request.ownerName,
                        color: kCMainBlack2,
                        fontSize: 14,
                        fontW: FW.demi,
                      ),
                      5.0.ESH(),
                      CustomText(
                        text: request.specializationsTitle,
                        color: kCMainBlack2,
                        fontSize: 12,
                        fontW: FW.light,
                      ),
                      5.0.ESH(),
                      CustomText(
                        text: request.ownerAddress,
                        color: kCMainGrey,
                        fontSize: 10,
                        fontW: FW.semicond,
                      ),
                      5.0.ESH(),
                      CustomText(
                        text: request.ownerPhone,
                        color: kCMainGrey,
                        fontSize: 10,
                        fontW: FW.semicond,
                      ),
                    ],
                  ),
                ),
                isMine?
                8.0.ESW():0.0.ESH(),
                isMine?
                Row(
                  children: [
                    IconWidget(
                      icon: 'assets/icons/edit.png',
                      onEditTap: (){
                        debugPrint("clicked her 11");
                        if(onEdit!=null){
                          onEdit!();
                          debugPrint("clicked her 12");
                        }
                        debugPrint("clicked her 13");
                      },
                    ),
                    IconWidget(
                      icon: 'assets/icons/delete.png',
                      onEditTap: (){
                        debugPrint("clicked her 122");

                        if(onDelete!=null){
                          debugPrint("clicked her 123");

                        onDelete!();
                        }
                      },
                    ),
                  ],
                ):0.0.ESH(),
              ],
            ),
            16.0.ESH(),
            ButtonDefault(
              title: 'عرض السيرة الزاتية',
              height: 46.h,
            )
          ],
        ),
      ),
    );
  }
}

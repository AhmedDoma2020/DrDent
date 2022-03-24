import 'package:dr_dent/Src/bloc/model/product.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/StoreFeature/ui/screens/product_screen.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../features/HomeFeature/bloc/model/info_requets_model.dart';
import '../GeneralWidgets/icon_widget.dart';
import '/src/core/utils/extensions.dart';


class CardPerson extends StatelessWidget {
  final InfoRequestModel request;
  final VoidCallback? onDelete;

  CardPerson({required this.request,this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.transparent,
          border: Border.all(color: Color(0xffD2D2D2),width: 1)
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: request.name,
                    color: kCMainBlack,
                    fontW: FW.semibold,
                    fontSize: 15,
                  ),
                  7.0.ESH(),
                  CustomText(
                    text: request.phone,
                    color: kCMainGrey,
                    fontW: FW.regular,
                    fontSize: 12,
                  ),7.0.ESH(),
                  SizedBox(
                    width: 200.w,
                    child: CustomText(
                      text: request.product.title,
                      color: kCMainGrey,
                      fontW: FW.regular,
                      fontSize: 12,
                      overflow: true,
                    ),
                  ),
                ],
              ),
            ),
            IconWidget(
              icon: 'assets/icons/delete.png',
              onEditTap: onDelete??(){}
            ),
          ],
        ),
      ),
    );
  }


}

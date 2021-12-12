import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/ui/widgets/GeneralWidgets/custom_text.dart';

class TitleRowViewAll extends StatelessWidget {
  const TitleRowViewAll({
    Key? key,
    required this.titleSlider,
    required this.onTap,
    required this.titleOnTap,
  }) : super(key: key);

  final String titleSlider;
  final VoidCallback onTap;
  final String titleOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              child: CustomText(
                text: titleSlider,
                color: Colors.black,
                fontW: FW.semibold,
                fontSize: 16,
              )),
          InkWell(
            onTap: onTap,
            child: Container(
                padding: EdgeInsets.all(2),
                child: Row(
                  children: [
                    CustomText(
                      text: titleOnTap,
                      color: Colors.deepOrange,
                      fontW: FW.regular,
                      fontSize: 13,
                    ),
                    Icon(Icons.arrow_forward_ios,color: Colors.deepOrange,size: 14.w,)
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

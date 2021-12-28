import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/StoreFeature/ui/widgets/product_info_item.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 300.h,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft:  Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  )
                ),
                child: ImageNetwork(
                  url: 'https://images.pexels.com/photos/139398/thermometer-headache-pain-pills-139398.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                  width: double.infinity,
                  height: 320.h,
                ),
              ),
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: 16.w
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      CustomText(
                        text: 'أدوات طبية',
                        color: kCMainGrey,
                        fontW: FW.thin,
                        fontSize: 14,
                      ),
                      4.0.ESH(),
                      const ProductInfoItem(
                        title: 'أدوات تنظيف الأسنان',
                        subtitle: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة ',
                      ),
                      15.0.ESH(),
                      const ProductInfoItem(
                        title: 'تاريخ انتهاء الصلاحية',
                        subtitle: '22/5/2025',
                      ),
                      15.0.ESH(),
                      const ProductInfoItem(
                        title: 'تاريخ انتهاء الصلاحية',
                        subtitle: '22/5/2025',
                      ),
                      100.0.ESH(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(
              bottom: 16.h
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ButtonDefault(
                title: 'الإستعلام عن سعر المنتج',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

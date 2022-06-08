import 'package:dr_dent/Src/bloc/controller/lang_controller.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LanScreen extends StatelessWidget {
  const LanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LangController _langController = Get.put(LangController());
    return Scaffold(
      appBar: AppBars.appBarDefault(title: "change_lan".tr),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: GetBuilder<LangController>(
            builder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.0.ESH(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SizedBox(
                      width: 262.w,
                      child: CustomText(
                        text:
                            "Select_the_language_in_which_you_want_to_proceed_in_the_application",
                        fontW: FW.semicond,
                      )),
                ),
                32.0.ESH(),
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      _.changeLangIndex(_.langList[index].id);
                      _.changeLang(_.langList[index].id);
                    },
                    child: LangRowForm(
                      active: _.active==_.langList[index].id,
                      lanTitle: _.langList[index].langTitle!,
                    ),
                  ),
                  separatorBuilder: (context, index) => 16.0.ESH(),
                  itemCount: _.langList.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LangRowForm extends StatelessWidget {
  final String lanTitle;
  final bool active;

  const LangRowForm({
    required this.lanTitle,
    required this.active,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:active ?kCSubMain : Colors.white,
      height: 48.h,
      width: double.infinity,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
          child: CustomText(
            text: lanTitle,
            color: active?Colors.white:kCBlackTitle,
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}

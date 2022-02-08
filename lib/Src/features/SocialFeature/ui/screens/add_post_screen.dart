import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Controller/add_post_controller.dart';
import 'package:dr_dent/Src/features/SocialFeature/ui/widgets/add_image_post_widget.dart';
import 'package:dr_dent/Src/features/SocialFeature/ui/widgets/add_media_button_bar_form.dart';
import 'package:dr_dent/Src/features/SocialFeature/ui/widgets/info_post_widget.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:dr_dent/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddPostController _addPostController =Get.put(AddPostController());
    var node = FocusScope.of(context);
    return SafeArea(
      child: GetBuilder<AddPostController>(
        builder:(_) =>  Scaffold(
          appBar: AppBars.appBarDefault(
            title: "add_post".tr,
            secondIconImage: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Center(
                child: ButtonDefault(
                  width: 63,
                  height: 48,
                  radius: 6,
                  title: 'publishing_'.tr,
                  buttonColor: _.img64 != null || !_.isContentCEmpty ?kCActiveButton:kCActiveButton.withOpacity(0.3),
                  titleSize: 13,
                  onTap: _.img64 != null ||  !_.isContentCEmpty ? () {
                    _.submit();
                  }:(){},
                ),
              ),
            ),
          ),
          body: SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      24.0.ESH(),
                      InfoPostWidget(),
                      4.0.ESH(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: TextFieldDefault(
                          hint: 'Write_your_description_here'.tr,
                          controller: _.contentController,
                          fieldType: FieldType.WithOutBorder,
                          disableBorder: Colors.transparent,
                          focusBorder: Colors.transparent,
                          keyboardType: TextInputType.multiline,
                          enableBorder:  Colors.transparent,
                          maxLines: 3,
                          horizentalPadding: 16,
                          // onChanged: (val){
                          //   // _.setContentController(val);
                          //   _.setContentController(val);
                          // },
                          onComplete: () {
                            node.unfocus();
                          },
                        ),
                      ),
                      16.0.ESH(),
                      _.image != null
                          ?
                      AddImagePostForm():0.0.ESW(),
                      60.0.ESH(),
                    ],
                  ),
                ),
                AddMediaButtonBarForm(),
              ],
            ),
          ),

        ),
      ),
    );
  }
}

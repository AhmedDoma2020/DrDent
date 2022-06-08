import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/row_top_bottom_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../TextFields/text_field_default.dart';
import '/src/core/utils/extensions.dart';

class SheetSharePost extends StatefulWidget {


  final String content;
  final Function(String?) onSave;
  final bool isEdit;

  SheetSharePost({required this.onSave,this.content='',this.isEdit=false});

  @override
  State<SheetSharePost> createState() => _SheetSharePostState();
}

class _SheetSharePostState extends State<SheetSharePost> {

  late TextEditingController contentController;


  @override
  void initState() {
    super.initState();
    contentController = TextEditingController();
    if(widget.content.isNotEmpty){
      contentController.text = widget.content;
    }
  }


  @override
  void dispose() {
    super.dispose();
    contentController.dispose();
  }

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(19.r),
          topRight: Radius.circular(19.r),
        ),
        child: Container(
          width: double.infinity,
          height: 320.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(19.r),
                topRight: Radius.circular(19.r),
              ),
              color: Colors.white),
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 24.h),
            child: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RowTopBottomSheet(title: 'share_post'),
                      24.0.ESH(),
                      TextFieldDefault(
                        hint: 'Write_the_content_of_the_post'.tr,
                        controller: contentController,
                        keyboardType: TextInputType.name,
                        fieldType: FieldType.WithBorder,
                        horizentalPadding: 16,
                        maxLines: 3,
                        onComplete: () {
                          node.nextFocus();
                        },
                      ),
                    ],
                  ),
                  ButtonDefault(
                    title: 'save_',
                    onTap: () {
                      Get.back();
                      node.unfocus();
                     if(widget.onSave!=null){
                       widget.onSave(contentController.text);
                     }else{
                       // Get.back();
                     }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

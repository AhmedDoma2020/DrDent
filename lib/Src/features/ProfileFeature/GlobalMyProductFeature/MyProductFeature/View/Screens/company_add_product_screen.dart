import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/upload_photo_of_work_licenses.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/MyCertificationFeature/Ui/Widget/certification_image_form.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalMyProductFeature/MyProductFeature/Bloc/Controller/company_add_product_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalMyProductFeature/MyProductFeature/Bloc/Controller/fetch_categories_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalMyProductFeature/MyProductFeature/View/Widget/image_form_local.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'choose_the_category_sheet.dart';

class CompanyAddProduct extends StatelessWidget {
  const CompanyAddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    Get.put(AddACompanyProductController());
    Get.put(FetchCategoriesController());
    return SafeArea(
        child: Scaffold(
          appBar: AppBars.appBarSkipDefault(
              title: "add_product".tr,
              onTapBack: () {
                Get.back();
              },
          ),
          body: GetBuilder<AddACompanyProductController>(
            builder: (_) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: _.globalKey,
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.0.ESH(),
                    CustomText(text: 'Add_a_picture_of_the_product'.tr,),
                    16.0.ESH(),
                    SizedBox(
                      height: 124.h,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _.imageFileList.length==4?0.0.ESW():
                            GestureDetector(
                              onTap: _.getImages,
                              child: Container(
                                height: 124.h,
                                width: 124.w,
                                decoration: BoxDecoration(
                                    color: kCLightGrey,
                                    borderRadius: BorderRadius.circular(10.r)
                                ),
                                child: Icon(Icons.add,color: Colors.white,size: 42.h,),
                              ),
                            ),
                            16.0.ESW(),
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => ImageFormForm(
                                onDelete:   () {
                                  _.deleteImage(index);
                                },
                                image: _.imageFileList[index],
                              ),
                              separatorBuilder:(context, index) =>  16.0.ESW(),
                              itemCount: _.imageFileList.length,
                            ),
                          ],
                        ),
                      ),
                    ),
                    24.0.ESH(),
                    TextFieldDefault(
                      hint: 'product_name'.tr,
                      errorText: "error_product_name_field".tr,
                      controller: _.nameController,
                      keyboardType: TextInputType.name,
                      filledColor: kCBGTextFormFiled,
                      fieldType: FieldType.WithBorder,
                      enableBorder: Colors.transparent,
                      horizentalPadding: 16,
                      onComplete: () {
                        node.nextFocus();
                      },
                    ),
                    // 16.0.ESH(),
                    // TextFieldDefault(
                    //   hint: 'Expiration_date'.tr,
                    //   errorText: "error_expiration_date_field".tr,
                    //   controller: _.expiredDateController,
                    //   keyboardType: TextInputType.name,
                    //   filledColor: kCBGTextFormFiled,
                    //   fieldType: FieldType.WithBorder,
                    //   enableBorder: Colors.transparent,
                    //   horizentalPadding: 16,
                    //   onComplete: () {
                    //     node.nextFocus();
                    //   },
                    // ),
                    16.0.ESH(),
                    GestureDetector(
                      onTap: (){
                        Get.bottomSheet(
                            CategoryButtonSheet(
                              onTap: (id, title) {
                                _.setCategoryId = id;
                                _.productRatingController!.text = title;
                              },
                            ),
                            isScrollControlled: true);
                      },
                      child: TextFieldDefault(
                        hint: 'choose_the_category'.tr,
                        errorText: "error_product_rating_field".tr,
                        controller: _.productRatingController,
                        keyboardType: TextInputType.name,
                        filledColor: kCBGTextFormFiled,
                        fieldType: FieldType.WithBorder,
                        enableBorder: Colors.transparent,
                        suffixIconData: Icons.keyboard_arrow_down_outlined,
                        disableBorder: Colors.transparent,
                        enable: false,
                        horizentalPadding: 16,
                        onComplete: () {
                          node.nextFocus();
                        },
                      ),
                    ),
                    16.0.ESH(),
                    TextFieldDefault(
                      hint: 'Product_Description'.tr,
                      errorText: "error_Product_Description_field".tr,
                      controller: _.textController,
                      keyboardType: TextInputType.name,
                      filledColor: kCBGTextFormFiled,
                      fieldType: FieldType.WithBorder,
                      enableBorder: Colors.transparent,
                      horizentalPadding: 16,
                      maxLines: 3,
                      onComplete: () {
                        node.nextFocus();
                      },
                    ),
                    16.0.ESH(),
                    TextFieldDefault(
                      hint: 'How_to_use'.tr,
                      errorText: "error_How_to_use_field".tr,
                      controller: _.usabilityController,
                      keyboardType: TextInputType.name,
                      filledColor: kCBGTextFormFiled,
                      fieldType: FieldType.WithBorder,
                      enableBorder: Colors.transparent,
                      horizentalPadding: 16,
                      maxLines: 3,
                      onComplete: () {
                        node.unfocus();
                      },
                    ),
                    16.0.ESH(),
                    ButtonDefault(
                      title: 'save_contain'.tr,
                      onTap: () {
                        _.submit();
                      },
                    ),
                    24.0.ESH(),
                  ],
                ),
              ),
            ),
          ),
        ));

  }
}

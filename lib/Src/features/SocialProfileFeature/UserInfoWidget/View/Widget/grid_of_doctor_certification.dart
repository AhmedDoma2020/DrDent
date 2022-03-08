import 'package:dr_dent/Src/core/services/photo_view.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GridOfDoctorCertification extends StatelessWidget {
  final List<String> certifications;
  const GridOfDoctorCertification({
    required this.certifications,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("certifications iss ${certifications.length}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.0.ESH(),
        CustomText(text: 'doctors_certificate',fontW: FW.semicond,),
        8.0.ESH(),
        SizedBox(
          height: 92.h,
          width: double.infinity,
          child: ListView.separated(
            shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Center(
                    child: GestureDetector(
                        onTap: () {
                          Get.to(() => PhotoViewWidget(
                                imageProvider: NetworkImage(certifications[index]),
                              ));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: ImageNetwork(
                            url: certifications[index],
                            width:112,
                            height: 88,
                          ),
                        )),
                  ),
              separatorBuilder: (context, index) => 16.0.ESW(),
              itemCount: certifications.length),
        ),
      ],
    );
  }
}

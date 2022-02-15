import 'package:dr_dent/Src/core/services/photo_view.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CertificationImageForm extends StatelessWidget {
  final String image;
  final VoidCallback onDelete;

  const CertificationImageForm({
    required this.image,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        child: Stack(
          children: [
            Center(
              child: GestureDetector(
                onTap: (){
                  Get.to(() => PhotoViewWidget(imageProvider: NetworkImage(image),));
                },
                  child: ImageNetwork(
                url: image,
                width: double.infinity,
                height: double.infinity,
              )),
            ),
            Positioned(
              top: 8.h,
              left: 8.w,
              // right: 16.w,
              child: GestureDetector(
                onTap: onDelete,
                child: CircleAvatar(
                    backgroundColor: Colors.black45,
                    radius: 16.r,
                    child: Icon(
                      Icons.close_outlined,
                      color: Colors.white,
                      size: 20.h,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

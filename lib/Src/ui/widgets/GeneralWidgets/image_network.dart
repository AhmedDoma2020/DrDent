import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/constants/color_constants.dart';

class ImageNetwork extends StatelessWidget {
  final String? url;
  final double? width, height;
  final String defaultAvatar;
  const ImageNetwork({required this.url,required this.width ,required this.height ,this.defaultAvatar ="assets/image/defaultAvatar.png"});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height!.h,
      width: width!.w,
      imageUrl: url??defaultAvatar,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) =>
      const Icon(Icons.error, color: kCTFErrorText),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';




class PhotoViewWidget extends StatelessWidget {
  const PhotoViewWidget({
   required this.imageProvider,
    this.minScale,
    this.maxScale,
  });

  final ImageProvider imageProvider;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: PhotoViewWidget(
        imageProvider: imageProvider,
        minScale: minScale,
        maxScale: maxScale,
        // heroAttributes: const PhotoViewHeroAttributes(tag: "someTag.Home",),
      ),
    );
  }
}

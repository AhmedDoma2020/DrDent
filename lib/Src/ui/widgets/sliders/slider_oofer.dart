
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dr_dent/Src/bloc/model/add_model.dart';
import 'package:dr_dent/Src/bloc/model/adds.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/services/launcher_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CarouselList extends StatelessWidget {
  List<Adds> resAddsList;

  CarouselList({required this.resAddsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      child: CarouselSlider.builder(
          itemCount: resAddsList.length,
          // itemCount: 0,
          options: CarouselOptions(
            // onPageChanged: (index, _) {},
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 1),
            enlargeCenterPage: true,
            viewportFraction: .7,
            height:200.0.h,
          ),
          itemBuilder: (context, index , i) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:0.w),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) =>
                  //           HeroPhotoViewRouteWrapperClientHome(
                  //             imageProvider:
                  //             NetworkImage(resAddsList[index].image!),
                  //           ),
                  //     ));
                  launchURL(resAddsList[index].link!);
                },
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.r))),
                    color: Colors.transparent,
                    elevation: 1,
                    child: Image(
                      image: NetworkImage(resAddsList[index].image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}


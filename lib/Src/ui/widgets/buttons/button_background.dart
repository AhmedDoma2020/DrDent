import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ButtonBackGround extends StatelessWidget {
  final Widget? child;


  ButtonBackGround({this.child});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
          width: double.infinity,
          height: 100.h,
          duration: Duration(milliseconds: 0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: child
      ),
    );
  }
}

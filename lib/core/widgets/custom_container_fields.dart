import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerFields extends StatelessWidget {
  const CustomContainerFields({
    super.key,
    required this.height,
    required this.topPadding,
    required this.child,
    this.childTopPadding = 68,
    this.childRightPadding = 33,
    this.childLeftPadding = 33,
  });

  final double height;
  final Widget child;
  final double topPadding;
  final double childTopPadding;
  final double childRightPadding;
  final double childLeftPadding;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topPadding.h,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: height.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x40000000),
              spreadRadius: 10,
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(90.r),
            topRight: Radius.circular(90.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: childLeftPadding.w,
            top: childTopPadding.h,
            right: childRightPadding.w,
          ),
          child: child,
        ),
      ),
    );
  }
}

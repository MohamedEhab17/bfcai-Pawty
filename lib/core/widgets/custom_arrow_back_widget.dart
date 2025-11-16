import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/constants/app_colors.dart';

class CustomArrowBackWidget extends StatelessWidget {
  const CustomArrowBackWidget({
    super.key,
    this.onTap,
    this.backgroundColor = AppColors.white,
    this.iconColor = AppColors.grey,
    this.radius = 23,
    this.size = 24,
  });
  final void Function()? onTap;
  final Color backgroundColor;
  final Color iconColor;
  final double radius;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: radius.r,
        child: Icon(Icons.arrow_back_ios_new, size: size, color: iconColor),
      ),
    );
  }
}

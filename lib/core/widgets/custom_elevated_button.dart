import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.width = double.infinity,
    this.height = double.infinity,
    this.backgroundColor = AppColors.grey,
    this.textStyle,
    this.radius = 16,
    this.onTap,
  });
  final double width;
  final double height;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final String text;
  final double radius;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(64),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(text, style: textStyle ?? AppStyles.styleFredoka16Pink),
        ),
      ),
    );
  }
}

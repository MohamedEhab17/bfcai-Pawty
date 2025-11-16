import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/utils/app_styles.dart';

class TwoDividerSeparatedWithText extends StatelessWidget {
  const TwoDividerSeparatedWithText({
    super.key,
    required this.text,
    this.width = 125,
    this.color = AppColors.grey,
  });
  final String text;
  final double width;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: color,
            thickness: 2.w,
            endIndent: 15.w,
            indent: 15.w,
          ),
        ),
        Text(text, style: AppStyles.styleInter12Grey),
        Expanded(
          child: Divider(
            color: color,
            thickness: 2.w,
            endIndent: 15.w,
            indent: 15.w,
          ),
        ),
      ],
    );
  }
}

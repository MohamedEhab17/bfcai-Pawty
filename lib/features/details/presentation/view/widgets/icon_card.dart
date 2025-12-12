
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pawty/core/constants/app_colors.dart';

class IconCard extends StatelessWidget {
  const IconCard({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 7.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.pink),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
            color: AppColors.shadowColor,
          ),
        ],
      ),
      child: SvgPicture.asset(icon, width: 32.w, height: 32.h),
    );
  }
}

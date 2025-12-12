import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/utils/app_styles.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.firstText,
    this.secondText,
    this.isIcon = false,
    this.iconData = Icons.male,
  });
  final String firstText;
  final String? secondText;
  final bool isIcon;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 16.w),
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
      child: Column(
        children: [
          Text(
            firstText,
            style: AppStyles.styleInter12White.copyWith(
              color: AppColors.pink,
              fontWeight: FontWeight.w700,
            ),
          ),
          isIcon
              ? Icon(iconData)
              : Text(secondText ?? '', style: AppStyles.styleInter18Black),
        ],
      ),
    );
  }
}

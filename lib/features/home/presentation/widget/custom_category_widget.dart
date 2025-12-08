import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/utils/app_styles.dart';

class CategoryTabItem extends StatelessWidget {
  final String text;
  final bool isActive;

  const CategoryTabItem({super.key, required this.text, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.pink[1]!.withAlpha(179)
            : AppColors.grey.withAlpha(179),
        borderRadius: BorderRadius.circular(100.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: isActive
            ? AppStyles.styleFredoka16Grey
            : AppStyles.styleFredoka16White,
      ),
    );
  }
}

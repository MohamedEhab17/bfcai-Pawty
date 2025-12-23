import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/utils/app_styles.dart';

class CustomListTileWIdget extends StatelessWidget {
  const CustomListTileWIdget({
    super.key,
    required this.title,
    required this.iconPath,
    this.onTap,  this.withArrow=true,
  });
  final String title;
  final String iconPath;
  final void Function()? onTap;
  final bool withArrow;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      onTap: onTap,
      tileColor: AppColors.white,
      leading: Image.asset(
        iconPath,
        height: 24.h,
        width: 24.w,
        color: AppColors.pink,
      ),
      title: Text(title, style: AppStyles.styleFredoka12),
      trailing:withArrow? Icon(
        IconlyBold.arrowRight3,
        size: 20.sp,
        color: AppColors.pink,
      ):null,
    );
  }
}

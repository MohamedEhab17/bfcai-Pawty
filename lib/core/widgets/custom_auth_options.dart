
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pawty/core/utils/app_icons.dart';

class CustomAuthOptions extends StatelessWidget {
  const CustomAuthOptions({super.key, this.googleOnPressed, this.guestOnPressed, required this.iconSize, required this.spacing});
  final void Function()? googleOnPressed;
  final void Function()? guestOnPressed;
  final double iconSize;
  final double spacing;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: spacing.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: googleOnPressed,
          icon: SvgPicture.asset(
            AssetsIcons.iconsGoogle,
            width: iconSize.w,
            height: iconSize.h,
          ),
        ),

        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AssetsIcons.iconsGuest,
            width: iconSize.w,
            height: iconSize.h,
          ),
        ),
      ],
    );
  }
}

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/utils/app_icons.dart';
import 'package:pawty/core/utils/app_styles.dart';

class CustomUploadImage extends StatelessWidget {
  const CustomUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => log('Upload Image'),
      child: Container(
        width: double.infinity,
        height: 150.h,

        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            radius: Radius.circular(10),
            color: AppColors.pink[1]!,
            dashPattern: [4, 10],
            strokeWidth: 3.w,

            stackFit: StackFit.expand,
            strokeCap: StrokeCap.round,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundColor: Color(0xffFDF3F6),
                child: SvgPicture.asset(
                  AssetsIcons.iconsCamera,
                  colorFilter: ColorFilter.mode(
                    AppColors.pink[2]!,
                    BlendMode.srcIn,
                  ),
                  height: 40.h,
                  width: 40.w,
                ),
              ),

              Text('Upload Photo', style: AppStyles.styleInter14Grey),
            ],
          ),
        ),
      ),
    );
  }
}

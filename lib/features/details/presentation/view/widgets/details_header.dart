
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/utils/app_images.dart';
import 'package:pawty/core/widgets/custom_arrow_back_widget.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(32.r),
          child: Image.asset(
            AssetsImages.imagesDog,
            width: double.infinity,
            height: 250.h,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 17.h,
          left: 14.w,
          child: CustomArrowBackWidget(
            onTap: () { context.pop();},
            iconColor: AppColors.pink[2]!,
            radius: 16,
            backgroundColor: AppColors.pink[5]!,
            size: 20,
          ),
        ),
      ],
    );
  }
}

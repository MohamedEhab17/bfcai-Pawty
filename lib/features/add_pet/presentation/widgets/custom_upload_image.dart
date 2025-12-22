import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/utils/app_icons.dart';
import 'package:pawty/core/utils/app_styles.dart';
import 'package:cached_network_image_widget/cached_network_image_widget.dart';

class CustomUploadImage extends StatelessWidget {
  const CustomUploadImage({super.key, this.imageUrl, this.onTap});

  final String? imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            radius: Radius.circular(10),
            color: AppColors.pink[1]!,
            dashPattern: const [4, 10],
            strokeWidth: 3.w,
            stackFit: StackFit.expand,
            strokeCap: StrokeCap.round,
          ),
          child: imageUrl == null
              ? _UploadPlaceholder()
              : _UploadedImage(imageUrl: imageUrl!),
        ),
      ),
    );
  }
}

class _UploadPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundColor: const Color(0xffFDF3F6),
          child: SvgPicture.asset(
            AssetsIcons.iconsCamera,
            colorFilter: ColorFilter.mode(AppColors.pink[2]!, BlendMode.srcIn),
            height: 40.h,
            width: 40.w,
          ),
        ),
        SizedBox(height: 8.h),
        Text('Upload Photo', style: AppStyles.styleInter14Grey),
      ],
    );
  }
}

class _UploadedImage extends StatelessWidget {
  const _UploadedImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: CachedNetworkImageWidget(
        imageUrl,
        fit: BoxFit.contain,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

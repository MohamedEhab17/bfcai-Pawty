import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/utils/app_images.dart';

class PawsSeparator extends StatelessWidget {
  const PawsSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AssetsImages.imagesPaws,
        width: 200.w,
        height: 15.h,
      ),
    );
  }
}
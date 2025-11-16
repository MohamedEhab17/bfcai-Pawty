import 'package:flutter/material.dart';
import 'package:pawty/core/utils/app_images.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImages.imagesBackground),
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
      ),
      child: widget,
    );
  }
}

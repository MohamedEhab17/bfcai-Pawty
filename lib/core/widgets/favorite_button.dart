import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pawty/core/constants/app_colors.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    this.size,
    this.inactiveIconColor,
    this.isFavorite = false,
    this.onTap,
  });
  final double? size;
  final Color? inactiveIconColor;
  final bool isFavorite;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        isFavorite ? IconlyBold.heart : IconlyLight.heart,
        color: isFavorite ? AppColors.pink : inactiveIconColor ?? Colors.white,
        size: size ?? 20,
      ),
    );
  }
}

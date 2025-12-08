import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pawty/core/constants/app_colors.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key, this.size, this.inactiveIconColor});
  final double? size;
  final Color? inactiveIconColor;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isFavorite = !isFavorite;
        setState(() {});
      },
      child: Icon(
        isFavorite ? IconlyBold.heart : IconlyLight.heart,
        color: isFavorite
            ? AppColors.pink
            : widget.inactiveIconColor ?? Colors.white,
        size: widget.size ?? 20,
      ),
    );
  }
}

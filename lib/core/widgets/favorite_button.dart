import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pawty/core/constants/app_colors.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key, this.size});
  final double? size;

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
        isFavorite ? IconlyBold.heart : IconlyBold.heart,
        color: isFavorite ? AppColors.pink : Colors.white,
        size: widget.size ?? 20,
      ),
    );
  }
}

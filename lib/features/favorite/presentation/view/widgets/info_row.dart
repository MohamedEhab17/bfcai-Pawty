import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/utils/app_styles.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.text, required this.iconPath});
  final String text;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 5,
      children: [
        SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(AppColors.pink, BlendMode.srcIn),
          width: 16,
          height: 16,
        ),
        Expanded(
          child: Text(
            text,
            style: AppStyles.styleInter12Grey,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

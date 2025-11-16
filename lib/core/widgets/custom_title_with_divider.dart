import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/utils/app_styles.dart';

class CustomTitleWithDivider extends StatelessWidget {
  const CustomTitleWithDivider({
    super.key,
    required this.firstText,
    required this.secondText,
    this.firstTextColor = AppColors.grey,
    this.secondTextColor = AppColors.pink,
  });
  final String firstText;
  final String secondText;
  final Color firstTextColor;
  final Color secondTextColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: firstText,
                style: AppStyles.styleFredoka36Grey.copyWith(
                  color: firstTextColor,
                ),
              ),
              TextSpan(
                text: secondText,
                style: AppStyles.styleFredoka36Pink.copyWith(
                  color: secondTextColor,
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          width: 80.w,
          child: Divider(
            color: AppColors.pink,
            thickness: 3.5.w,

            //  endIndent: 320.w,
          ),
        ),
      ],
    );
  }
}

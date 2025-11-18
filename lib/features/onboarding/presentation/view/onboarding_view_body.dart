import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/extensions/padding_ex.dart';
import 'package:pawty/core/extensions/sized_box_ex.dart';
import 'package:pawty/core/utils/app_icons.dart';
import 'package:pawty/core/utils/app_styles.dart';
import 'package:pawty/core/widgets/custom_elevated_button.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Spacer(flex: 5),
          Image.asset(AssetsIcons.iconsLogo, height: 237.h, width: 243.w),
          18.height,
          Text("Pawty", style: AppStyles.styleFredoka64),
          Spacer(flex: 3),
          Text(
            "Your pet shop",
            style: AppStyles.styleFredoka20.copyWith(
              letterSpacing: 5,
              wordSpacing: 8,
            ),
          ),
          15.height,
          Padding(
            padding: 35.hPadding,
            child: CustomElevatedButton(
              // width: 320,
              //height: 60,
              backgroundColor: AppColors.pink,
              textStyle: AppStyles.styleFredoka20,
              text: 'Get Started',
              radius: 10,
            ),
          ),

          Spacer(flex: 2),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/utils/app_icons.dart';
import 'package:pawty/core/utils/app_styles.dart';
import 'package:pawty/core/widgets/text_form_field_helper.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, bottom: 25),
      child: Row(
        spacing: 5,
        children: [
          Expanded(
            child: TextFormFieldHelper(
              hint: "Search your favorite pet",
              borderRadius: BorderRadius.circular(100.r),
              borderColor: AppColors.grey,
              hintStyle: AppStyles.styleInter14,
            ),
          ),
          FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: AppColors.grey,
            elevation: 0,
            heroTag: 'search',
            onPressed: () {},
            child: SvgPicture.asset(
              AssetsIcons.iconsSearch,
              height: 30,
              width: 30,
            ),
          ),
        ],
      ),
    );
  }
}

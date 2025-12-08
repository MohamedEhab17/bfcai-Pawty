import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pawty/core/utils/app_icons.dart';
import 'package:pawty/core/utils/app_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, this.name = "Demy"});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(right: 16, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.7,
                child: RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: 'Hello, ',
                    style: AppStyles.styleFredoka24Grey,

                    children: [
                      TextSpan(
                        text: '$name!',
                        style: AppStyles.styleFredoka24Pink,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                spacing: 2,
                children: [
                  SvgPicture.asset(
                    AssetsIcons.iconsLocation,
                    height: 12.h,
                    width: 12.w,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    child: Text(
                      'Benha, Egypt',
                      style: AppStyles.styleFredoka12,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Image.asset(AssetsIcons.iconsLogo, height: 45.h, width: 46.w),
        ],
      ),
    );
  }
}

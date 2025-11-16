import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/constants/fonts_type.dart';

abstract class AppStyles {
  //! Fredoka 12
  static TextStyle styleFredoka12 = TextStyle(
    fontSize: 12.sp,
    fontFamily: fredoka,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  //! Fredoka 16
  static TextStyle styleFredoka16White = TextStyle(
    fontSize: 16.sp,
    fontFamily: fredoka,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static TextStyle styleFredoka16Grey = TextStyle(
    fontSize: 16.sp,
    fontFamily: fredoka,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static TextStyle styleFredoka16Pink = TextStyle(
    fontSize: 16.sp,
    fontFamily: fredoka,
    fontWeight: FontWeight.w400,
    color: AppColors.pink[4],
  );
  //! Fredoka 20
  static TextStyle styleFredoka20 = TextStyle(
    fontSize: 20.sp,
    fontFamily: fredoka,
    fontWeight: FontWeight.w400,
    color: AppColors.pink[4],
  );
  //! Fredoka 24
  static TextStyle styleFredoka24 = TextStyle(
    fontSize: 24.sp,
    fontFamily: fredoka,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static TextStyle styleFredoka24Pink = TextStyle(
    fontSize: 24.sp,
    fontFamily: fredoka,
    fontWeight: FontWeight.w400,
    color: AppColors.pink,
  );
  static TextStyle styleFredoka24Grey = TextStyle(
    fontSize: 24.sp,
    fontFamily: fredoka,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static TextStyle styleFredoka24Black = TextStyle(
    fontSize: 24.sp,
    fontFamily: fredoka,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  //! Fredoka 32
  static TextStyle styleFredoka32 = TextStyle(
    fontSize: 32.sp,
    fontFamily: fredoka,
    fontWeight: FontWeight.w400,
    color: AppColors.pink,
  );
  //! Fredoka 36
  static TextStyle styleFredoka36Grey = TextStyle(
    fontSize: 36.sp,
    fontFamily: fredoka,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static TextStyle styleFredoka36Pink = TextStyle(
    fontSize: 36.sp,
    fontFamily: fredoka,
    fontWeight: FontWeight.w400,
    color: AppColors.pink,
  );
  //! Fredoka 40
  static TextStyle styleFredoka40 = TextStyle(
    fontSize: 40.sp,
    fontFamily: fredoka,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  //! Fredoka64
  static TextStyle styleFredoka64 = TextStyle(
    fontSize: 64.sp,
    fontFamily: fredoka,
    fontWeight: FontWeight.w400,
    color: AppColors.pink,
  );
  //*-------------------------------------------------------------
  //*-------------------------------------------------------------
  //! inter 10
  static TextStyle styleInter10Black = TextStyle(
    fontSize: 10.sp,
    fontFamily: inter,
    fontWeight: FontWeight.bold,
    color: AppColors.black[1]!.withAlpha(153),
  );
  static TextStyle styleInter10Grey = TextStyle(
    fontSize: 10.sp,
    fontFamily: inter,
    fontWeight: FontWeight.bold,
    color: AppColors.grey,
  );
  //! inter 12
  static TextStyle styleInter12White = TextStyle(
    fontSize: 12.sp,
    fontFamily: inter,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle styleInter12Grey = TextStyle(
    fontSize: 12.sp,
    fontFamily: inter,
    fontWeight: FontWeight.w600,
    color: AppColors.grey,
  );
  //! inter 14
  static TextStyle styleInter14Pink = TextStyle(
    fontSize: 14.sp,
    fontFamily: inter,
    fontWeight: FontWeight.bold,
    color: AppColors.pink,
  );
  static TextStyle styleInter14Grey = TextStyle(
    fontSize: 14.sp,
    fontFamily: inter,
    fontWeight: FontWeight.bold,
    color: AppColors.grey,
  );

  static TextStyle styleInter14 = TextStyle(
    fontSize: 14.sp,
    fontFamily: inter,
    fontWeight: FontWeight.w600,
    color: AppColors.black.withAlpha(128),
  );
  //! inter 16
  static TextStyle styleInter16White = TextStyle(
    fontSize: 16.sp,
    fontFamily: inter,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle styleInter16Pick = TextStyle(
    fontSize: 16.sp,
    fontFamily: inter,
    fontWeight: FontWeight.bold,
    color: AppColors.pink,
  );
  static TextStyle styleInter16LightPick = TextStyle(
    fontSize: 16.sp,
    fontFamily: inter,
    fontWeight: FontWeight.bold,
    color: AppColors.pink[4],
  );
  static TextStyle styleInter16black1 = TextStyle(
    fontSize: 16.sp,
    fontFamily: inter,
    fontWeight: FontWeight.bold,
    color: AppColors.black[1],
  );
  static TextStyle styleInter16blackOpacity = TextStyle(
    fontSize: 16.sp,
    fontFamily: inter,
    fontWeight: FontWeight.bold,
    color: AppColors.black.withAlpha(179),
  );
  //! inter 18
  static TextStyle styleInter18Grey = TextStyle(
    fontSize: 18.sp,
    fontFamily: inter,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );
  static TextStyle styleInter18Black = TextStyle(
    fontSize: 18.sp,
    fontFamily: inter,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  //! inter 20
  static TextStyle styleInter20 = TextStyle(
    fontSize: 20.sp,
    fontFamily: inter,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  //! inter 24
  static TextStyle styleInter24 = TextStyle(
    fontSize: 24.sp,
    fontFamily: inter,
    fontWeight: FontWeight.bold,
    color: AppColors.black[1],
  );
}

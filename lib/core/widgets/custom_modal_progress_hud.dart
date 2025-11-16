import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pawty/core/constants/app_colors.dart';


class CustomModalProgressHUD extends StatelessWidget {
  const CustomModalProgressHUD({
    super.key,
    required this.widget,
    required this.state,
  });
  final Widget widget;
  final bool state;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: state ,
      color: AppColors.grey.withAlpha(150),
      progressIndicator: SpinKitChasingDots(color: AppColors.pink, size: 50.sp),
      child: widget,
    );
  }
}

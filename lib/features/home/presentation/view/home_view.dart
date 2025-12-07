import 'package:flutter/material.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/features/home/presentation/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.white, body: HomeViewBody());
  }
}

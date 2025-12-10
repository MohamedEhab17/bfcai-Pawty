import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/features/app_section/data/model/app_tab.dart';
import '../view_model/cubit/bottom_nav_cubit.dart';

class FloatingNavBar extends StatelessWidget {
  final List<AppTab> tabs;
  final PageController pageController;

  const FloatingNavBar({
    super.key,
    required this.tabs,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          left: 0,
          right: 0,
          bottom: state.visible ? 0 : -MediaQuery.sizeOf(context).height * 0.2,
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.grey.withAlpha(178),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(tabs.length, (i) {
                  final bool isActive = i == state.index;
                  return GestureDetector(
                    onTap: () {
                      context.read<BottomNavCubit>().setIndex(i);
                      pageController.animateToPage(
                        i,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(8),
                      height: 50.h,
                      width: 50.h,
                      decoration: BoxDecoration(
                        color: isActive
                            ? AppColors.pink[2]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Icon(
                        tabs[i].icon,
                        size: isActive ? 32 : 28,
                        color: isActive ? AppColors.grey : AppColors.pink[2],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}

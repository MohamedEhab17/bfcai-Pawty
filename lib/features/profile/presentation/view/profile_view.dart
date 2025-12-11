import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/extensions/padding_ex.dart';
import 'package:pawty/core/utils/app_icons.dart';
import 'package:pawty/core/utils/app_styles.dart';
import 'package:pawty/features/profile/presentation/widgets/custom_list_tile_widget.dart';
import 'package:pawty/features/profile/presentation/widgets/profile_header.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        //! Profile Header
        ProfileHeader(),
        //! Account
        SliverToBoxAdapter(child: SizedBox(height: 70.h)),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Text("Account", style: AppStyles.styleFredoka16Grey),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: 16.hPadding,
            child: Card(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              shadowColor: AppColors.black,
              elevation: 3,
              child: Column(
                children: [
                  CustomListTileWIdget(
                    title: "Manage Account",
                    iconPath: AssetsIcons.iconsManageProfile,
                    onTap: () {},
                  ),
                  Divider(
                    color: AppColors.grey[3],
                    thickness: 1.w,
                    indent: 16.w,
                    endIndent: 16.w,
                  ),
                  CustomListTileWIdget(
                    title: "Password & Security",
                    iconPath: AssetsIcons.iconsPassword,
                    onTap: () {},
                  ),
                  Divider(
                    color: AppColors.grey[3],
                    thickness: 1.w,
                    indent: 16.w,
                    endIndent: 16.w,
                  ),
                  CustomListTileWIdget(
                    title: "English",
                    iconPath: AssetsIcons.iconsLanguage,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        //! Preferences
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Text("Preferences", style: AppStyles.styleFredoka16Grey),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: 16.hPadding,
            child: Card(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              shadowColor: AppColors.black,
              elevation: 3,
              child: Column(
                children: [
                  CustomListTileWIdget(
                    title: "About us",
                    iconPath: AssetsIcons.iconsAboutUs,
                    onTap: () {},
                  ),
                  Divider(
                    color: AppColors.grey[3],
                    thickness: 1.w,
                    indent: 16.w,
                    endIndent: 16.w,
                  ),
                  CustomListTileWIdget(
                    title: "Theme",
                    iconPath: AssetsIcons.iconsTheme,
                    onTap: () {},
                  ),
                  Divider(
                    color: AppColors.grey[3],
                    thickness: 1.w,
                    indent: 16.w,
                    endIndent: 16.w,
                  ),
                  CustomListTileWIdget(
                    title: "Appointments",
                    iconPath: AssetsIcons.iconsAppointments,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        //! Support
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Text("Support", style: AppStyles.styleFredoka16Grey),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: 16.hPadding,
            child: Card(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              shadowColor: AppColors.black,
              elevation: 3,
              child: Column(
                children: [
                  CustomListTileWIdget(
                    title: "Help Center",
                    iconPath: AssetsIcons.iconsHelpCenter,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: kBottomNavigationBarHeight + 80.h),
        ),
      ],
    );
  }
}

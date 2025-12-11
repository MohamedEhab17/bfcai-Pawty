import 'package:flutter/material.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/utils/app_images.dart';
import 'package:pawty/core/utils/app_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, this.title = "Mohamed Ehab"});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        final scrollHeight = constraints.scrollOffset;

        final isCollapsed = scrollHeight > 140;

        return SliverAppBar(
          backgroundColor: AppColors.pink[1],
          pinned: true,
          floating: true, // ← ده اللي هيخلي leading يظهر بدري
          snap: false, // ← مهم يفضل false
          stretch: false,
          automaticallyImplyLeading: false,
          expandedHeight: 220,
          collapsedHeight: kToolbarHeight + 10,
          leading: isCollapsed
              ? Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage(AssetsImages.imagesAvatar),
                  ),
                )
              : null,
          centerTitle: isCollapsed ? false : true,
          title: Text(title, style: AppStyles.styleInter20),
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              double maxHeight = 220;
              double minHeight = kToolbarHeight + 10;
              double current = constraints.maxHeight;

              double t = ((current - minHeight) / (maxHeight - minHeight))
                  .clamp(0, 1);

              double radius = 50 * t;

              double offsetY = 35 * t;

              return Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(color: AppColors.pink[1]),

                  if (!isCollapsed)
                    Positioned(
                      bottom: -offsetY,
                      child: CircleAvatar(
                        radius: radius,
                        backgroundImage: AssetImage(AssetsImages.imagesAvatar),
                      ),
                    ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

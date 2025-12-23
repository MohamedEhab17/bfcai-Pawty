import 'package:cached_network_image_widget/cached_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/utils/app_images.dart';
import 'package:pawty/core/utils/app_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, this.title = " ", this.imageUrl});
  final String title;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        final scrollHeight = constraints.scrollOffset;

        final isCollapsed = scrollHeight > 140;

        return SliverAppBar(
          backgroundColor: AppColors.pink[1],
          pinned: true,
          floating: true,
          snap: false,
          stretch: false,
          automaticallyImplyLeading: false,
          expandedHeight: 220,
          collapsedHeight: kToolbarHeight + 10,
          leading: isCollapsed
              ? Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: isCollapsed
                      ? Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: _profileAvatar(18),
                        )
                      : null,
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
                    Positioned(bottom: -offsetY, child: _profileAvatar(radius)),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _profileAvatar(double radius) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.white,
      child: ClipOval(
        child: imageUrl != null && imageUrl!.isNotEmpty
            ? CachedNetworkImageWidget(
                imageUrl!,
                width: radius * 2,
                height: radius * 2,
                fit: BoxFit.cover,
              )
            : Image.asset(
                AssetsImages.imagesAvatar,
                width: radius * 2,
                height: radius * 2,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

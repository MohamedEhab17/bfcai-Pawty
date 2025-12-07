import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/extensions/padding_ex.dart';
import 'package:pawty/core/extensions/sized_box_ex.dart';
import 'package:pawty/core/utils/app_images.dart';
import 'package:pawty/core/utils/app_styles.dart';
import 'package:pawty/core/widgets/favorite_button.dart';

class ItemCategoryCard extends StatefulWidget {
  const ItemCategoryCard({super.key, this.detailsTap, this.favoriteTap});
  final void Function()? detailsTap;
  final Function()? favoriteTap;

  @override
  State<ItemCategoryCard> createState() => _ItemCategoryCardState();
}

class _ItemCategoryCardState extends State<ItemCategoryCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 16.rightPadding,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      // height: 230.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withAlpha(127),
            BlendMode.darken,
          ),
          image: AssetImage(AssetsImages.imagesDog),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 9.r,
                child: Image.asset(AssetsImages.imagesAvatar),
              ),
              6.width,
              Text('Rawan', style: AppStyles.styleInter12White),
              Spacer(),
              Icon(Icons.more_vert, color: AppColors.white),
            ],
          ),
          // SizedBox(height: 78.h),
          Spacer(),
          Text("Milo", style: AppStyles.styleFredoka32.copyWith(height: 1.2)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Cavapoo dog", style: AppStyles.styleInter16White),
                  Row(
                    children: [
                      FavoriteButton(),
                      6.width,
                      Text(
                        'add to favorites',
                        style: AppStyles.styleInter12White,
                      ),
                    ],
                  ),
                ],
              ),

              // Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.pink[2]!.withAlpha(178),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
                child: Text(
                  'See all details',
                  style: AppStyles.styleInter10Grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

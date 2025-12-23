import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawty/features/favorite/presentation/view_model/favorite/favorite_cubit.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/extensions/padding_ex.dart';
import 'package:pawty/core/extensions/sized_box_ex.dart';
import 'package:pawty/core/routers/app_route_paths.dart';
import 'package:pawty/core/utils/app_images.dart';
import 'package:pawty/core/utils/app_styles.dart';
import 'package:pawty/core/widgets/favorite_button.dart';

class ItemCategoryCard extends StatefulWidget {
  const ItemCategoryCard({
    super.key,
    this.detailsTap,
    this.favoriteTap,
    this.pet,
  });
  final void Function()? detailsTap;
  final Function()? favoriteTap;
  final PetModelDto? pet;

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
          image: widget.pet?.image != null
              ? NetworkImage(widget.pet!.image!)
              : AssetImage(AssetsImages.imagesDog) as ImageProvider,
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
                backgroundImage: widget.pet?.user?.imageUrl != null
                    ? NetworkImage(widget.pet!.user!.imageUrl!)
                    : AssetImage(AssetsImages.imagesAvatar) as ImageProvider,
              ), // User image placeholder
              6.width,
              Expanded(
                child: Text(
                  widget.pet?.user?.fullName ??
                      'Owner', // Placeholder for owner name
                  style: AppStyles.styleInter12White,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Spacer(),
              Icon(Icons.more_vert, color: AppColors.white),
            ],
          ),
          Spacer(),
          Text(
            widget.pet?.name ?? "Milo",
            style: AppStyles.styleFredoka32.copyWith(height: 1.2),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        widget.pet?.type ?? "Cavapoo dog",
                        style: AppStyles.styleInter16White,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        BlocBuilder<FavoriteCubit, FavoriteState>(
                          builder: (context, state) {
                            final cubit = context.read<FavoriteCubit>();
                            final isFav = cubit.isFavorite(widget.pet?.id);
                            return FavoriteButton(
                              isFavorite: isFav,
                              onTap: () {
                                if (widget.pet != null) {
                                  cubit.toggleFavorite(widget.pet!);
                                }
                              },
                            );
                          },
                        ),
                        6.width,
                        Text(
                          'add to favorites',
                          style: AppStyles.styleInter12White,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Spacer(),
              ElevatedButton(
                onPressed: () {
                  context.push(AppRoutesPaths.detailsView, extra: widget.pet);
                },
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

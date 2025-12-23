import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/extensions/sized_box_ex.dart';
import 'package:pawty/core/routers/app_route_paths.dart';
import 'package:pawty/core/utils/app_images.dart';
import 'package:pawty/core/utils/app_styles.dart';
import 'package:pawty/core/widgets/custom_elevated_button.dart';
import 'package:pawty/core/widgets/favorite_button.dart';
import 'package:pawty/features/favorite/presentation/view/widgets/custom_title.dart';
import 'package:pawty/features/favorite/presentation/view_model/favorite/favorite_cubit.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return Center(
              child: SpinKitChasingDots(color: AppColors.pink, size: 50.sp),
            );
          } else if (state is FavoriteError) {
            return Center(child: Text(state.message));
          } else if (state is FavoriteSuccess) {
            if (state.favorites.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetsImages.imagesDog, height: 200.h),
                    16.height,
                    Text(
                      "No favorites yet!",
                      style: AppStyles.styleFredoka24Pink,
                    ),
                    8.height,
                    Text(
                      "Go add some pets to your favorites list.",
                      style: AppStyles.styleInter16blackOpacity,
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.w),
              itemCount: state.favorites.length,
              itemBuilder: (context, index) {
                final pet = state.favorites[index];
                return Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 10.h,
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.shadowColor),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    spacing: 12,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              ClipRRect(
                                child: pet.image != null
                                    ? Image.network(
                                        pet.image!,
                                        fit: BoxFit.cover,
                                        width: 150.w,
                                        height: 150.w,
                                      )
                                    : Image.asset(
                                        AssetsImages.imagesDog,
                                        fit: BoxFit.cover,
                                        width: 150.w,
                                        height: 150.w,
                                      ),
                              ),
                              Positioned(
                                top: -10,
                                right: -10,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.white,
                                  child: FavoriteButton(
                                    isFavorite: true,
                                    inactiveIconColor: AppColors.pink,
                                    onTap: () {
                                      if (pet.id != null) {
                                        context
                                            .read<FavoriteCubit>()
                                            .toggleFavorite(pet);
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CustomTitle(
                            age: pet.age ?? 'N/A',
                            location: pet.location ?? 'N/A',
                            name: pet.name ?? 'Unknown',
                            type: pet.type ?? 'Unknown',
                          ),
                        ],
                      ),
                      CustomElevatedButton(
                        text: 'View Details',
                        onTap: () {
                          context.push(AppRoutesPaths.detailsView, extra: pet);
                        },
                        backgroundColor: AppColors.pink,
                        height: 40.h,
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/features/home/presentation/view_model/home/home_cubit.dart';
import 'package:pawty/features/profile/presentation/view_model/profile/profile_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/widgets/paws_separator.dart';
import 'package:pawty/features/home/presentation/widget/home_header.dart';
import 'package:pawty/features/home/presentation/widget/custom_search_bar.dart';
import 'package:pawty/features/home/presentation/widget/custom_tab_bar.dart';
import 'package:pawty/features/home/presentation/widget/item_category_card.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Fetch pets when widget initializes
    context.read<HomeCubit>().getPets();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: HomeHeader()),
                SliverToBoxAdapter(
                  child: CustomSearchBar(
                    onChanged: (value) {
                      context.read<HomeCubit>().searchPets(value ?? "");
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16, bottom: 25),
                    child: PawsSeparator(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomTabBar(
                    onCategorySelected: (category) {
                      context.read<HomeCubit>().getPets(category: category);
                    },
                  ),
                ),
                if (state is HomeLoading)
                  SliverFillRemaining(
                    child: Center(
                      child: SpinKitChasingDots(
                        color: AppColors.pink,
                        size: 50.sp,
                      ),
                    ),
                  )
                else if (state is HomeError)
                  SliverFillRemaining(child: Center(child: Text(state.message)))
                else if (state is HomeSuccess)
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.sizeOf(context).width > 600
                          ? 2
                          : 1,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 6,
                      childAspectRatio: 358.h / 210.w,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          ItemCategoryCard(pet: state.pets[index]),
                      childCount: state.pets.length,
                    ),
                  )
                else
                  // Fallback for initial or empty state, showing dummy data as before or empty
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.sizeOf(context).width > 600
                          ? 2
                          : 1,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 6,
                      childAspectRatio: 358.h / 210.w,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => ItemCategoryCard(),
                      childCount: 10,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

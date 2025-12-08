import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/utils/app_images.dart';
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: HomeHeader()),
            SliverToBoxAdapter(child: CustomSearchBar()),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 16, bottom: 25),
                child: Center(
                  child: Image.asset(
                    AssetsImages.imagesPaws,
                    width: 200.w,
                    height: 15.h,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: CustomTabBar()),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
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
  }
}

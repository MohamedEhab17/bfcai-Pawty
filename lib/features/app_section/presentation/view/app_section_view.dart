import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pawty/features/app_section/data/model/app_tab.dart';
import 'package:pawty/features/app_section/presentation/widgets/floating_nav_bar.dart';
import 'package:pawty/features/app_section/presentation/widgets/scroll_visibility_wrapper.dart';
import 'package:pawty/features/home/presentation/view/home_view.dart';
import 'package:pawty/features/favorite/presentation/view/favorite_view.dart';
import 'package:pawty/features/add_pet/presentation/view/add_pet_view.dart';
import '../view_model/cubit/bottom_nav_cubit.dart';

class AppSectionView extends StatefulWidget {
  const AppSectionView({super.key});

  @override
  State<AppSectionView> createState() => _AppSectionViewState();
}

class _AppSectionViewState extends State<AppSectionView> {
  late final PageController _pageController;
  late final List<AppTab> tabs;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    tabs = [
      AppTab(
        icon: IconlyBold.home,
        view: const HomeView(),
      ), // wrap inside pages where needed
      AppTab(icon: IconlyBold.heart, view: const FavoriteView()),
      AppTab(icon: Icons.add_circle_outline_rounded, view: const AddPetView()),
      AppTab(icon: IconlyBold.notification, view: const Scaffold()),
      AppTab(icon: Icons.person, view: const Scaffold()),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildWrappedView(int i) {
    // Wrap only pages that are scrollable with ScrollVisibilityWrapper.
    // If a view is NOT scrollable, you can wrap it as well — it's harmless.
    return ScrollVisibilityWrapper(child: tabs[i].view);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: tabs.length,
                  onPageChanged: (i) {
                    context.read<BottomNavCubit>().setIndex(i);
                    context.read<BottomNavCubit>().show();
                  },
                  itemBuilder: (_, i) => _buildWrappedView(i),
                ),

                // floating nav bar on top
                FloatingNavBar(tabs: tabs, pageController: _pageController),
              ],
            ),
          );
        },
      ),
    );
  }
}

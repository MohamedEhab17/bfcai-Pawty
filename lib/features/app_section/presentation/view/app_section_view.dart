// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pawty/core/constants/app_colors.dart';
// import 'package:pawty/features/add_pet/presentation/view/add_pet_view.dart';
// import 'package:pawty/features/favorite/presentation/view/favorite_view.dart';
// import 'package:pawty/features/home/presentation/view/home_view.dart';

// class AppSectionView extends StatefulWidget {
//   const AppSectionView({super.key});

//   @override
//   State<AppSectionView> createState() => _AppSectionViewState();
// }

// class _AppSectionViewState extends State<AppSectionView> {
//   late final PageController _pageController;
//   late final ValueNotifier<int> selectedIndex;
//   late final ValueNotifier<bool> showNavBar;

//   late List<ScrollController> scrollControllers;

//   final List<Widget> views = [
//     const HomeView(),
//     const FavoriteView(),
//     const AddPetView(),
//     const Scaffold(),
//     const Scaffold(),
//   ];

//   @override
//   void initState() {
//     super.initState();

//     selectedIndex = ValueNotifier(0);
//     showNavBar = ValueNotifier(true);
//     _pageController = PageController(initialPage: selectedIndex.value);

//     scrollControllers = List.generate(views.length, (_) => ScrollController());

//     for (var controller in scrollControllers) {
//       double lastOffset = 0;

//       controller.addListener(() {
//         double currentOffset = controller.offset;

//         if (currentOffset > lastOffset + 6) {
//           // scrolling down → hide navbar
//           if (showNavBar.value == true) showNavBar.value = false;
//         } else if (currentOffset < lastOffset - 6) {
//           // scrolling up → show navbar
//           if (showNavBar.value == false) showNavBar.value = true;
//         }

//         lastOffset = currentOffset;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: selectedIndex,
//       builder: (context, currentIndex, _) {
//         return Scaffold(
//           backgroundColor: AppColors.white,
//           body: Stack(
//             children: [
//               /// ---------- PageView ----------
//               PageView.builder(
//                 controller: _pageController,
//                 itemCount: views.length,
//                 onPageChanged: (i) {
//                   selectedIndex.value = i;
//                   // when page changes → show navbar
//                   showNavBar.value = true;
//                 },
//                 itemBuilder: (_, i) {
//                   return ScrollConfiguration(
//                     behavior: const ScrollBehavior().copyWith(
//                       overscroll: false,
//                     ),
//                     child: PrimaryScrollController(
//                       controller: scrollControllers[i],
//                       child: views[i],
//                     ),
//                   );
//                 },
//               ),

//               /// ---------- FLOATING NAVBAR ----------
//               ValueListenableBuilder(
//                 valueListenable: showNavBar,
//                 builder: (_, isVisible, __) {
//                   return AnimatedPositioned(
//                     duration: const Duration(milliseconds: 250),
//                     curve: Curves.easeOut,
//                     left: 0,
//                     right: 0,
//                     bottom: isVisible ? 0 : -100,// hide navbar
//                     child: SafeArea(
//                       child: Container(
//                         margin: const EdgeInsets.all(16),
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 9,
//                           horizontal: 16,
//                         ),
//                         decoration: BoxDecoration(
//                           color: AppColors.grey.withAlpha(178),
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: List.generate(5, (i) {
//                             final icon = [
//                               IconlyBold.home,
//                               IconlyBold.heart,
//                               Icons.add_circle_outline_rounded,
//                               IconlyBold.notification,
//                               Icons.person,
//                             ][i];

//                             final bool isActive = i == currentIndex;

//                             return GestureDetector(
//                               onTap: () {
//                                 selectedIndex.value = i;
//                                 showNavBar.value = true;

//                                 _pageController.animateToPage(
//                                   i,
//                                   duration: const Duration(milliseconds: 300),
//                                   curve: Curves.easeOut,
//                                 );
//                               },
//                               child: AnimatedContainer(
//                                 duration: const Duration(milliseconds: 300),
//                                 padding: const EdgeInsets.all(8),
//                                 height: 50.h,
//                                 width: 50.h,
//                                 decoration: BoxDecoration(
//                                   color: isActive
//                                       ? AppColors.pink[2]
//                                       : Colors.transparent,
//                                   borderRadius: BorderRadius.circular(100.r),
//                                 ),
//                                 child: Icon(
//                                   icon,
//                                   size: isActive ? 32 : 28,
//                                   color: isActive
//                                       ? AppColors.grey
//                                       : AppColors.pink[2],
//                                 ),
//                               ),
//                             );
//                           }),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

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

// Import other views as needed

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

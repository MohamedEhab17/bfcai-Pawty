import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/features/home/presentation/view/home_view.dart';

class AppSectionView extends StatefulWidget {
  const AppSectionView({super.key});

  @override
  State<AppSectionView> createState() => _AppSectionViewState();
}

class _AppSectionViewState extends State<AppSectionView> {
  static List<IconData> navBarIcons = [
    IconlyBold.home,
    Icons.chat,
    Icons.add_circle_outline_rounded,
    IconlyBold.notification,
    Icons.person,
  ];

  static List<Widget> views = [
    HomeView(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          views[selectedIndex],
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 35),
              padding: EdgeInsets.only(bottom: 16, left: 12, right: 12, top: 8),
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.grey.withAlpha(178),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: navBarIcons.map((e) {
                  int i = navBarIcons.indexOf(e);
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    padding: EdgeInsets.all(8),
                    height: 45,
                    decoration: BoxDecoration(
                      color: i == selectedIndex
                          ? AppColors.pink[2]
                          : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          child: Icon(
                            e,
                            size: 32,
                            color: i == selectedIndex
                                ? AppColors.grey
                                : AppColors.pink[2],
                          ),
                          onTap: () {
                            selectedIndex = i;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

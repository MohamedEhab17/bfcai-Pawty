import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/extensions/padding_ex.dart';
import 'package:pawty/core/utils/pets_category_list.dart';
import 'package:pawty/features/home/presentation/widget/custom_category_widget.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.bottomPadding,
      child: SizedBox(
        height: 55.h,
        child: TabBar(
          controller: _tabController,
          onTap: (int index) {},
          isScrollable: true,
          padding: EdgeInsets.zero,
          splashBorderRadius: BorderRadius.circular(100.r),
          tabAlignment: TabAlignment.start,
          indicatorPadding: EdgeInsets.zero,
          labelPadding: 6.rightPadding,
          indicatorColor: Colors.transparent,
          dividerHeight: 0,
          dividerColor: Colors.transparent,
          tabs: List.generate(ConstantLists.petCategories.length, (index) {
            return Tab(
              child: CategoryTabItem(
                text: ConstantLists.petCategories[index],
                isActive: index == selectedIndex,
              ),
            );
          }),
        ),
      ),
    );
  }

  int selectedIndex = 0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: ConstantLists.petCategories.length,
      vsync: this,
    );
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          selectedIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

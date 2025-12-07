import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/extensions/padding_ex.dart';
import 'package:pawty/core/extensions/sized_box_ex.dart';
import 'package:pawty/core/utils/app_icons.dart';
import 'package:pawty/core/utils/app_images.dart';
import 'package:pawty/core/utils/app_styles.dart';
import 'package:pawty/core/widgets/text_form_field_helper.dart';
import 'package:pawty/features/home/presentation/widget/custom_category_widget.dart';
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
    return Padding(
      padding: const EdgeInsets.only(top: 42, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! home_header
          CustomAppBar(),
          25.height,
          //! home_body
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              spacing: 5,
              children: [
                Expanded(
                  child: TextFormFieldHelper(
                    hint: "Search your favorite pet",
                    borderRadius: BorderRadius.circular(100.r),
                    borderColor: AppColors.grey,
                    hintColor: AppColors.black.withAlpha(127),
                  ),
                ),
                FloatingActionButton(
                  shape: CircleBorder(),
                  backgroundColor: AppColors.grey,
                  elevation: 0,
                  heroTag: 'search',

                  onPressed: () {},
                  child: SvgPicture.asset(AssetsIcons.iconsSearch),
                ),
              ],
            ),
          ),
          25.height,
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Image.asset(
                AssetsImages.imagesPaws,
                width: 200.w,
                height: 15.h,
              ),
            ),
          ),
          25.height,
          // SizedBox(
          //   height: 55.h,
          //   child: ListView.separated(
          //     padding: EdgeInsets.zero,
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return CustomCategoryWidget(
          //         isActive: index % 2 == 0 ? true : false,
          //         text: 'Cat',
          //         onTap: () {},
          //       );
          //     },
          //     itemCount: 10,
          //     separatorBuilder: (context, index) => 6.width,
          //   ),
          // ),
          // DefaultTabController(
          //   length: 10,
          //   child: SizedBox(
          //     height: 55.h,
          //     child: TabBar(
          //       onTap: (int index) {
          //         selectedIndex = index;
          //       },
          //       isScrollable: true,
          //       padding: EdgeInsets.zero,
          //       tabAlignment: TabAlignment.start,
          //       indicatorPadding: EdgeInsets.zero,
          //       labelPadding: 6.rightPadding,
          //       indicatorColor: Colors.transparent,
          //       dividerHeight: 0,
          //       dividerColor: Colors.transparent,
          //       tabs: List.generate(10, (index) {
          //         return Tab(
          //           child: CategoryTabItem(
          //             text: 'Cat',
          //             isActive: index == selectedIndex,
          //           ),
          //         );
          //       }),
          //     ),
          //   ),
          // ),
          SizedBox(
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
              tabs: List.generate(10, (index) {
                return Tab(
                  child: CategoryTabItem(
                    text: 'Cat',
                    isActive: index == selectedIndex,
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20,
                crossAxisSpacing: 6,
                // childAspectRatio: 358.h / 235.w,
                childAspectRatio: 358.h / 210.w,
                crossAxisCount: MediaQuery.sizeOf(context).width > 600 ? 2 : 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ItemCategoryCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  int selectedIndex = 0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 10, vsync: this);
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

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.name = "Demy"});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.rightPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Hello, ',
                  style: AppStyles.styleFredoka24Grey,
                  children: [
                    TextSpan(
                      text: '$name!',
                      style: AppStyles.styleFredoka24Pink,
                    ),
                  ],
                ),
              ),
              Row(
                spacing: 2,
                children: [
                  SvgPicture.asset(
                    AssetsIcons.iconsLocation,
                    height: 12.h,
                    width: 12.w,
                  ),
                  Text('Benha, Egypt', style: AppStyles.styleFredoka12),
                ],
              ),
            ],
          ),
          Image.asset(AssetsIcons.iconsLogo, height: 45.h, width: 46.w),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/utils/app_images.dart';
import 'package:pawty/core/widgets/custom_elevated_button.dart';
import 'package:pawty/features/favourite/presentation/view/widgets/custom_title.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.w),
        itemCount: 15,

        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
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
            spacing: 5,
            children: [
              Row(
                spacing: 5,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        child: Image.asset(
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
                          child: Icon(Icons.favorite, color: AppColors.pink),
                        ),
                      ),
                    ],
                  ),
                  CustomTitle(
                    age: '2 years',
                    location: 'New York, USA',
                    name: 'Luna',
                    type: 'Tabby Cat',
                  ),
                ],
              ),
              CustomElevatedButton(
                text: 'View Details',
                onTap: () {},
                backgroundColor: AppColors.pink,
                height: 35.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

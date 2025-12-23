import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/extensions/sized_box_ex.dart';
import 'package:pawty/core/utils/app_icons.dart';
import 'package:pawty/core/utils/app_images.dart';
import 'package:pawty/core/utils/app_styles.dart';
import 'package:pawty/core/widgets/custom_elevated_button.dart';
import 'package:pawty/core/widgets/paws_separator.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';
import 'package:pawty/features/details/presentation/view/widgets/details_header.dart';
import 'package:pawty/features/details/presentation/view/widgets/icon_card.dart';
import 'package:pawty/features/details/presentation/view/widgets/info_card.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, this.appPet});
  final PetModelDto? appPet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsHeader(image: appPet?.image),
            10.height,
            PawsSeparator(),
            19.height,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 19.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.pink, width: 2),
                borderRadius: BorderRadius.circular(12.r),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    appPet?.name ?? 'Motchi',
                    style: AppStyles.styleFredoka40,
                  ),
                  3.height,
                  Row(
                    spacing: 5.w,
                    children: [
                      Text('4.5 Kilos away', style: AppStyles.styleInter16Pick),
                      Spacer(),
                      SvgPicture.asset(AssetsIcons.iconsLocation),
                      Text(
                        appPet?.location ?? 'Benha, Egypt',
                        style: AppStyles.styleInter16blackOpacity,
                      ),
                    ],
                  ),
                  15.height,
                  Wrap(
                    spacing: 22.w,
                    runSpacing: 15.h,
                    children: [
                      InfoCard(
                        firstText: 'Age',
                        secondText: appPet?.age ?? '4Y',
                      ),
                      InfoCard(
                        firstText: 'Sex',
                        isIcon: true,
                        iconData: appPet?.gender == 'Female'
                            ? Icons.female
                            : Icons.male,
                      ),
                      InfoCard(firstText: 'Weight', secondText: '2Kg'),
                      InfoCard(
                        firstText: 'Type',
                        secondText: appPet?.type ?? 'Cat',
                      ),
                    ],
                  ),
                  15.height,
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 22.r,
                      backgroundImage: appPet?.user?.imageUrl != null
                          ? NetworkImage(appPet!.user!.imageUrl!)
                          : AssetImage(AssetsImages.imagesAvatar)
                                as ImageProvider,
                    ),

                    title: Text(
                      appPet?.user?.fullName ?? 'Owner',
                      style: AppStyles.styleInter16black1,
                    ),
                    subtitle: Text(
                      appPet?.location ?? 'Benha, Egypt',
                      style: AppStyles.styleInter10Grey,
                    ),
                  ),
                  10.height,
                  Text(
                    appPet?.description ??
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    style: AppStyles.styleInter12Grey,
                    softWrap: true,
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                  ),
                  14.height,
                  Row(
                    spacing: 11.w,
                    children: [
                      IconCard(icon: AssetsIcons.iconsPhone),
                      IconCard(icon: AssetsIcons.iconsChat),
                      Expanded(
                        child: CustomElevatedButton(
                          text: 'Adopt me',
                          backgroundColor: AppColors.pink,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

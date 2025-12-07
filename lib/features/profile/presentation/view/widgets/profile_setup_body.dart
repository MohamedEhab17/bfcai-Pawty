import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/extensions/sized_box_ex.dart';
import 'package:pawty/core/routers/app_route_paths.dart';
import 'package:pawty/core/utils/app_styles.dart';
import 'package:pawty/core/utils/pets_category_list.dart';
import 'package:pawty/core/widgets/custom_arrow_back_widget.dart';
import 'package:pawty/core/widgets/custom_background.dart';
import 'package:pawty/core/widgets/custom_container_fields.dart';
import 'package:pawty/core/widgets/custom_elevated_button.dart';
import 'package:pawty/core/widgets/custom_modal_progress_hud.dart';
import 'package:pawty/core/widgets/text_form_field_helper.dart';
import 'package:pawty/core/widgets/custom_dropdown_menu_container.dart';
import 'package:pawty/features/profile/presentation/view/widgets/custom_upload_image_widget.dart';

class ProfileSetupBody extends StatefulWidget {
  const ProfileSetupBody({super.key});

  @override
  State<ProfileSetupBody> createState() => _ProfileSetupBodyState();
}

class _ProfileSetupBodyState extends State<ProfileSetupBody> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  String? gender;
  String? country;
  bool isLoading = false;
  @override
  void dispose() {
    fullNameController.dispose();
    dateOfBirthController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomModalProgressHUD(
      state: isLoading,
      widget: CustomBackground(
        widget: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomContainerFields(
              height: 720,
              topPadding: 170,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 42.h),

                    Text(
                      'Pick a profile picture',
                      style: AppStyles.styleFredoka24,
                    ),
                    10.height,
                    Text(
                      'Have a favorite selfie? Upload it',
                      style: AppStyles.styleInter18Grey,
                    ),
                    23.height,
                    TextFormFieldHelper(
                      controller: fullNameController,
                      label: 'Full name',
                      isVisible: true,
                      keyboardType: TextInputType.name,
                      hint: 'Enter your full name',
                    ),
                    20.height,
                    TextFormFieldHelper(
                      isVisible: true,
                      controller: dateOfBirthController,
                      label: 'Date of birth',
                      hint: 'DD/MM/YYYY',
                      icon: Icons.calendar_today_outlined,

                      keyboardType: TextInputType.datetime,
                    ),
                    20.height,

                    CustomDropdownMenuContainer(
                      labelText: "Gender",
                      items: ConstantLists.gender,
                      initialValue: "male/female",
                      onChanged: (value) {
                        gender = value;
                      },
                    ),
                    20.height,
                    CustomDropdownMenuContainer(
                      labelText: "Country",
                      items: ConstantLists.countries,
                      initialValue: "USA",
                      onChanged: (value) {
                        country = value;
                      },
                    ),
                    30.height,
                    CustomElevatedButton(
                      onTap: () {
                        context.go(AppRoutesPaths.login);
                      },
                      width: double.infinity,
                      height: 48.h,
                      backgroundColor: AppColors.grey,
                      textStyle: AppStyles.styleFredoka16White,
                      text: 'Next',
                      radius: 10.r,
                    ),

                    SizedBox(height: 9.h),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 57,
              left: 16,
              child: CustomArrowBackWidget(
                onTap: () {
                  context.pop();
                },
              ),
            ),
            Positioned(
              top: 67.h,
              right: 98.w,
              left: 105.w,
              child: CustomUploadImageWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

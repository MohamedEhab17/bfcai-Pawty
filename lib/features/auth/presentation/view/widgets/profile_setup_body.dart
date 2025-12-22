import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/extensions/sized_box_ex.dart';
import 'package:pawty/core/routers/app_route_paths.dart';
import 'package:pawty/core/utils/app_styles.dart';
import 'package:pawty/core/utils/pets_category_list.dart';
import 'package:pawty/core/widgets/custom_background.dart';
import 'package:pawty/core/widgets/custom_container_fields.dart';
import 'package:pawty/core/widgets/custom_elevated_button.dart';
import 'package:pawty/core/widgets/custom_modal_progress_hud.dart';
import 'package:pawty/core/widgets/text_form_field_helper.dart';
import 'package:pawty/core/widgets/toast.dart';
import 'package:pawty/features/auth/presentation/view/widgets/custom_upload_image_widget.dart';
import 'package:pawty/features/auth/presentation/view_model/profile_setup/profile_setup_cubit.dart';
import 'package:pawty/shared/popup_form/view/custom_drop_down.dart';
import 'package:pawty/shared/popup_form/view_model/cubit/popup_form_cubit_cubit.dart';
import 'package:pawty/shared/popup_form/view_model/cubit/popup_form_state.dart';

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
 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    fullNameController.dispose();
    dateOfBirthController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileSetupCubit, ProfileSetupState>(
      listener: (context, state) {
       if(state is ProfileSetupSuccess){
         Toast.success(context, "added Successfully");
        
          context.pushReplacement(AppRoutesPaths.rootView);
       }
       else if (state is ProfileSetupError) {
          Toast.error(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
      state: state is ProfileSetupLoading,
      widget: CustomBackground(
        widget: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomContainerFields(
              height: 720,
              topPadding: 170,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
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
                      BlocBuilder<PopupFormCubit, PopupFormState>(
                        builder: (context, state) {
                          return CustomDropdown(
                            items: ConstantLists.gender,
                            value: gender,
                            hintText: 'Male/Female',
                            onChanged: (String? value) {
                              gender = value!;
                              context.read<PopupFormCubit>().setValue(
                                'userGender',
                                value,
                              );
                            },
                          );
                        },
                      ),
                      20.height,
                      BlocBuilder<PopupFormCubit, PopupFormState>(
                        builder: (context, state) {
                          return CustomDropdown(
                            items: ConstantLists.countries,
                            value: country,
                            hintText: 'select Country',
                            onChanged: (String? value) {
                              country = value!;
                              context.read<PopupFormCubit>().setValue(
                                'userCountry',
                                value,
                              );
                            },
                          );
                        },
                      ),
                      30.height,
                      CustomElevatedButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<ProfileSetupCubit>().addUser(
                              dateOfBirth:dateOfBirthController.text.trim() ,
                              gender: gender ,
                              // imageUrl: ,
                              userName: fullNameController.text.trim() ,
                                  country:  country);
                                  }
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
    },
    );
  }
}

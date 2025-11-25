import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/extensions/sized_box_ex.dart';
import 'package:pawty/core/routers/app_route_paths.dart';
import 'package:pawty/core/utils/app_styles.dart';
import 'package:pawty/core/utils/validation_methods.dart';
import 'package:pawty/core/widgets/custom_auth_options.dart';
import 'package:pawty/core/widgets/custom_background.dart';
import 'package:pawty/core/widgets/custom_container_fields.dart';
import 'package:pawty/core/widgets/custom_elevated_button.dart';
import 'package:pawty/core/widgets/custom_rich_text.dart';
import 'package:pawty/core/widgets/custom_title_with_divider.dart';
import 'package:pawty/core/widgets/text_form_field_helper.dart';
import 'package:pawty/core/widgets/two_divider_separated_with_text.dart';


class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailOrPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
    final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    emailOrPhoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      widget: Stack(
        children: [
          CustomContainerFields(
            height: 720,
            topPadding: 170,
            child: SingleChildScrollView(
              child: Form(
                key:signupFormKey ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    CustomTitleWithDivider(
                      firstText: 'Sign',
                      secondText: ' up',
                    ),
                   24.height,
                    TextFormFieldHelper(
                       isVisible: true,
                      label: 'User name',
                      keyboardType: TextInputType.name,
                      icon:
                        Icons.person_outline,
                        
                     
                      hint: 'Enter your user name',
                      onValidate: validateUsername,
                      controller: usernameController,
                    ),
                   16.height,
                    TextFormFieldHelper(
                       isVisible: true,
                      label: 'Email/Phone Number',
                      keyboardType: TextInputType.text,
                      icon: 
                        Icons.email_outlined,
                      hint: 'example@gmail.com',
                      controller: emailOrPhoneController,
                      onValidate: validateEmailOrPhone,
                    ),
                  16.height,
                    TextFormFieldHelper(
                       isVisible: true,
                      isPassword: true,
                      label: 'Password',
                      hint: 'hsgbfu%^*@#31',
                      icon: Icons.lock_outline,
                      onValidate: validatePassword,
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                    ),
                    
                    16.height,
                    TextFormFieldHelper(
                      isVisible: true,
                      isPassword: true,
                      controller: confirmPasswordController,
                      label: 'Confirm Password',
                      hint: 'confirm password',
                      icon: Icons.lock_outline,
                      onValidate: (value) => validateConfirmPassword(
                        value,
                        passwordController.text,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    23.height,
                    CustomElevatedButton(
                      width: double.infinity,
                      height: 48.h,
                      backgroundColor: AppColors.grey,
                      textStyle: AppStyles.styleFredoka16White,
                      text: 'Sign up',
                      radius: 10.r,
                      onTap: () {
                     
                     if(signupFormKey.currentState!.validate()){
                       context.push(AppRoutesPaths.profileSetup);
                     }
                      },
                    ),
                    9.height,
                    TwoDividerSeparatedWithText(text: 'Or sign up with'),
                    10.height,
                      CustomAuthOptions(iconSize: 50, spacing: 45),
                  10.height,
                    CustomRichText(
                      secondText: 'sign in',
                      firstText: 'Don\'t have an account? ',
                      onTap: () {
                        context.go(AppRoutesPaths.login);
                      },
                    ),
                    50.height,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

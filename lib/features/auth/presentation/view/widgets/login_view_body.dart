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
import 'package:pawty/core/widgets/custom_modal_progress_hud.dart';
import 'package:pawty/core/widgets/custom_rich_text.dart';
import 'package:pawty/core/widgets/custom_title_with_divider.dart';
import 'package:pawty/core/widgets/text_form_field_helper.dart';
import 'package:pawty/core/widgets/two_divider_separated_with_text.dart';
import 'package:pawty/features/auth/presentation/view/widgets/remember_forget_password.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailOrPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  bool rememberme = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    // _loadRememberedUser();
  }

  // Future<void> _loadRememberedUser() async {
  //   final data = await SharedPrefsServices.getRememberMe();
  //   if (data != null && data.rememberMe) {
  //     emailOrPhoneController.text = data.email ?? "";
  //     passwordController.text = data.password ?? "";
  //     setState(() {
  //       rememberme = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return CustomModalProgressHUD(
      state: isLoading,
      widget: CustomBackground(
        widget: Stack(
          children: [
            CustomContainerFields(
              height: 720,
              topPadding: 170,
              child: SingleChildScrollView(
                child: Form(
                  key: signinFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTitleWithDivider(
                        firstText: 'Sign',
                        secondText: ' in',
                      ),
                      40.height,
                      TextFormFieldHelper(
                        isVisible: true,
                        label: 'Email/Phone Number',
                        keyboardType: TextInputType.text,
                        icon: Icons.email_outlined,
                        hint: 'example@gmail.com',
                        controller: emailOrPhoneController,
                        onValidate: validateEmailOrPhone,
                      ),
                      28.height,
                      TextFormFieldHelper(
                        isVisible: true,
                        label: 'Password',
                        hint: 'Enter your password',
                        icon: Icons.lock_outline,
                        controller: passwordController,
                        onValidate: validatePassword,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      8.height,
                      RememberForgetPassword(
                        value: rememberme,
                        onChangedCheckBox: (val) {
                          rememberme = val ?? false;
                          setState(() {});
                        },
                      ),
                      SizedBox(height: 43.h),
                      CustomElevatedButton(
                        width: double.infinity,
                        height: 48.h,
                        backgroundColor: AppColors.grey,
                        textStyle: AppStyles.styleFredoka16White,
                        text: 'Login',
                        radius: 10.r,
                        onTap: () {
                          if (signinFormKey.currentState!.validate()) {
                            
                            context.push(AppRoutesPaths.rootView);
                          }
                        },
                      ),
                      9.height,
                      TwoDividerSeparatedWithText(text: 'Or sign in with'),
                      31.height,
                      CustomAuthOptions(iconSize: 65, spacing: 30),
                      22.height,
                      CustomRichText(
                        secondText: 'sign up',
                        firstText: 'Don\'t have an account? ',
                        onTap: () {
                          context.go(AppRoutesPaths.signup);
                        },
                      ),
                      SizedBox(height: 70.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

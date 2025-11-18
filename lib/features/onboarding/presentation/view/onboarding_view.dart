import 'package:flutter/material.dart';
import 'package:pawty/features/onboarding/presentation/widget/onboarding_view_body.dart';


class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: OnboardingViewBody(),
    );
  }
}

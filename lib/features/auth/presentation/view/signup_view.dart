import 'package:flutter/material.dart';
import 'package:pawty/features/auth/presentation/view/widgets/signup_view_body.dart';


class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: SignupViewBody());
  }
}

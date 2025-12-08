import 'package:flutter/material.dart';
import 'package:pawty/features/profile_setup/presentation/view/widgets/profile_setup_body.dart';


class ProfileSetupView extends StatelessWidget {
  const ProfileSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProfileSetupBody());
  }
}

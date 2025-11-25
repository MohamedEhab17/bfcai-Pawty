import 'package:flutter/material.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/utils/app_styles.dart';


class RememberForgetPassword extends StatelessWidget {
  const RememberForgetPassword({
    super.key,
    this.onPressedForgetText,
    this.onChangedCheckBox,
    required this.value,
  });

  final void Function()? onPressedForgetText;
  final void Function(bool?)? onChangedCheckBox;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChangedCheckBox,
          activeColor: AppColors.pink,
        ),
        Text('Remember me', style: AppStyles.styleInter14Grey),
        Spacer(),
        TextButton(
          onPressed: onPressedForgetText,
          child: Text(
            'Forgot Password?',
            style: AppStyles.styleInter14Pink,
          ),
        ),
      ],
    );
  }
}

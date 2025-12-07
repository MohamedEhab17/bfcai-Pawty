import 'package:flutter/material.dart';
import 'package:pawty/core/utils/app_icons.dart';
import 'package:pawty/core/utils/app_styles.dart';
import 'package:pawty/features/favourite/presentation/view/widgets/info_row.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.name,
    required this.type,
    required this.age,
    required this.location,
  });
  final String name, type, age, location;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: AppStyles.styleInter16black1),
          Text(type, style: AppStyles.styleInter12Grey),
          InfoRow(iconPath: AssetsIcons.iconsCalender, text: age),
          InfoRow(iconPath: AssetsIcons.iconsLocation, text: location),
        ],
      ),
    );
  }
}

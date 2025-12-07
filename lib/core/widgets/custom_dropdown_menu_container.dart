import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/utils/app_icons.dart';
import 'package:pawty/core/utils/app_styles.dart';

class CustomDropdownMenuContainer extends StatefulWidget {
  const CustomDropdownMenuContainer({
    super.key,
    required this.items,
    required this.labelText,
    this.initialValue,
    this.onChanged,
  });

  final List<String> items;
  final String labelText;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  @override
  State<CustomDropdownMenuContainer> createState() =>
      _CustomDropdownMenuContainerState();
}

class _CustomDropdownMenuContainerState
    extends State<CustomDropdownMenuContainer> {
  bool isDropped = false;
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue ?? widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: AppStyles.styleInter14Grey),
        GestureDetector(
          onTap: () {
            setState(() {
              isDropped = !isDropped;
            });
          },
          child: Container(
            height: 55.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 11),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.pink, width: 1),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor,
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedValue ?? "", style: AppStyles.styleInter12Grey),
                Image.asset(
                  isDropped
                      ? AssetsIcons.iconsArrowUp
                      : AssetsIcons.iconsArrowDropDown,
                  width: 24.w,
                  height: 24.h,
                ),
              ],
            ),
          ),
        ),
        if (isDropped)
          Container(
            margin: EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffEEEEEE),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: widget.items.map((item) {
                return ListTile(
                  title: Text(item, style: AppStyles.styleInter12Grey),
                  onTap: () {
                    setState(() {
                      selectedValue = item;
                      isDropped = false;
                    });
                    widget.onChanged?.call(item);
                  },
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}

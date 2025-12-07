import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/extensions/sized_box_ex.dart';
import 'package:pawty/core/utils/app_icons.dart';
import 'package:pawty/core/utils/app_styles.dart';
import 'package:pawty/core/utils/pets_category_list.dart';
import 'package:pawty/core/utils/validation_methods.dart';
import 'package:pawty/core/widgets/custom_dropdown_menu_container.dart';
import 'package:pawty/core/widgets/custom_elevated_button.dart';
import 'package:pawty/core/widgets/text_form_field_helper.dart';
import 'package:pawty/features/add_pet/presentation/view/widgets/custom_upload_image.dart';

class AddPetView extends StatefulWidget {
  const AddPetView({super.key});

  @override
  State<AddPetView> createState() => _AddPetViewState();
}

class _AddPetViewState extends State<AddPetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SafeArea(
          child: Form(
            key: addPetKey,
            child: Column(
              spacing: 15.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Help pets find their home',
                      style: AppStyles.styleFredoka24Grey,
                    ),
                    Spacer(),
                    Image.asset(
                      AssetsIcons.iconsLogo,
                      height: 30.h,
                      width: 30.w,
                    ),
                  ],
                ),

                5.height,
                Text('Pet Photo', style: AppStyles.styleInter14Grey),
                CustomUploadImage(),
                TextFormFieldHelper(
                  label: 'Pet Name',
                  hint: 'e.g., Max',
                  isVisible: true,
                  controller: petNameController,
                  onValidate: validateRequired,
                ),

                CustomDropdownMenuContainer(
                  items: ConstantLists.petCategories,
                  labelText: 'Type',
                  initialValue: 'Dogs',
                  onChanged: (value) {
                    petType = value;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 9.w,
                  children: [
                    Expanded(
                      child: TextFormFieldHelper(
                        label: 'Age',
                        hint: 'e.g., 2 ',
                        isVisible: true,
                        controller: petAgeController,
                        onValidate: validateAge,
                      ),
                    ),
                    Expanded(
                      child: CustomDropdownMenuContainer(
                        items: ConstantLists.gender,
                        labelText: 'Gender',
                        onChanged: (value) {
                          gender = value;
                        },
                        initialValue: 'male/female',
                      ),
                    ),
                  ],
                ),
                TextFormFieldHelper(
                  label: 'location',
                  hint: 'e.g., New York,USA ',
                  isVisible: true,
                  controller: petLocationController,
                  onValidate: validateRequired,
                ),

                TextFormFieldHelper(
                  label: 'Description',
                  hint: 'Tell us about your pet',
                  isVisible: true,
                  controller: petDescriptionController,
                  minLines: 5,
                  maxLines: 10,
                  onValidate: validateDescription,
                ),
                CustomElevatedButton(
                  text: 'Add Pet',
                  onTap: () {
                    if (addPetKey.currentState!.validate()) {
                      log('Add Pet Successfully');
                    }
                  },
                  backgroundColor: AppColors.pink,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  late final TextEditingController petNameController;
  late final TextEditingController petAgeController;
  late final TextEditingController petLocationController;
  late final TextEditingController petDescriptionController;
  late final GlobalKey<FormState> addPetKey;

  String? gender;

  String? petType;

  @override
  initState() {
    super.initState();

    petNameController = TextEditingController();
    petAgeController = TextEditingController();
    petLocationController = TextEditingController();
    petDescriptionController = TextEditingController();

    addPetKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    petNameController.dispose();
    petAgeController.dispose();
    petLocationController.dispose();
    petDescriptionController.dispose();
    addPetKey.currentState?.dispose();
    super.dispose();
  }
}

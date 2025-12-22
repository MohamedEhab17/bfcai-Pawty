import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/constants/app_colors.dart';
import 'package:pawty/core/extensions/sized_box_ex.dart';
import 'package:pawty/core/utils/app_icons.dart';
import 'package:pawty/core/utils/app_styles.dart';
import 'package:pawty/core/utils/pets_category_list.dart';
import 'package:pawty/core/utils/validation_methods.dart';
import 'package:pawty/core/widgets/custom_elevated_button.dart';
import 'package:pawty/core/widgets/custom_modal_progress_hud.dart';
import 'package:pawty/core/widgets/text_form_field_helper.dart';
import 'package:pawty/core/widgets/toast.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';
import 'package:pawty/features/add_pet/presentation/view_model/cubit/add_pet_cubit.dart';
import 'package:pawty/features/add_pet/presentation/widgets/custom_upload_image.dart';
import 'package:pawty/shared/popup_form/view/custom_drop_down.dart';
import 'package:pawty/shared/popup_form/view_model/cubit/popup_form_cubit_cubit.dart';
import 'package:pawty/shared/popup_form/view_model/cubit/popup_form_state.dart';

class AddPetView extends StatefulWidget {
  const AddPetView({super.key});

  @override
  State<AddPetView> createState() => _AddPetViewState();
}

class _AddPetViewState extends State<AddPetView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPetCubit, AddPetState>(
      listener: (context, state) {
        if (state is AddPetSuccess) {
          Toast.success(context, 'Pet added successfully');
          petNameController.clear();
          petAgeController.clear();
          petLocationController.clear();
          petDescriptionController.clear();
        } else if (state is AddPetError) {
          Toast.error(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
          state: state is AddPetLoading,
          widget: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                    CustomUploadImage(
                      imageUrl: state is UploadImageSuccess ? state.url : null,
                      onTap: () {
                        context.read<AddPetCubit>().uploadPetImage();
                      },
                    ),
                    TextFormFieldHelper(
                      label: 'Pet Name',
                      hint: 'e.g., Max',
                      isVisible: true,
                      controller: petNameController,
                      onValidate: validateRequired,
                    ),
                    BlocBuilder<PopupFormCubit, PopupFormState>(
                      builder: (context, state) {
                        return CustomDropdown(
                          label: 'Pet Type',
                          isVisible: true,
                          items: ConstantLists.petCategories,
                          value: petType,
                          onChanged: (String? value) {
                            petType = value!;
                            context.read<PopupFormCubit>().setValue(
                              'petType',
                              value,
                            );
                          },
                        );
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
                          child: BlocBuilder<PopupFormCubit, PopupFormState>(
                            builder: (context, state) {
                              return CustomDropdown(
                                label: 'Gender',
                                isVisible: true,
                                items: ConstantLists.gender,
                                value: gender,
                                onChanged: (String? value) {
                                  gender = value!;
                                  context.read<PopupFormCubit>().setValue(
                                    'petGender',
                                    value,
                                  );
                                },
                              );
                            },
                          ),
                          //  CustomDropdownMenuContainer(
                          //   items: ConstantLists.gender,
                          //   labelText: 'Gender',
                          //   onChanged: (value) {
                          //     gender = value;
                          //   },
                          //   initialValue: 'male/female',
                          // ),
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
                          final petModelDto = PetModelDto(
                            name: petNameController.text,
                            type: petType,
                            age: petAgeController.text,
                            gender: gender,
                            location: petLocationController.text,
                            description: petDescriptionController.text,
                            image: state is UploadImageSuccess
                                ? state.url
                                : null,
                          );
                          context.read<AddPetCubit>().addPet(petModelDto);
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
      },
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

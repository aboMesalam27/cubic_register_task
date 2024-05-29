import 'package:cubic_task/modules/module1/view/screens/register/logic/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../core/helpers/app_regex.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/colors.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../data/models/branches/branches_response.dart';
import '../logic/cubit/auth_cubit.dart';

class RegisterForms extends StatefulWidget {
  const RegisterForms({super.key});

  @override
  State<RegisterForms> createState() => _RegisterFormsState();
}

class _RegisterFormsState extends State<RegisterForms> {
  bool isObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  String? selectBranch;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        if (state is BranchesLoaded) {
          return Form(
            key: context.read<RegisterCubit>().formKey,
            child: Column(
              children: [
                AppTextFormField(
                  hintText: 'name'.tr(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter_name'.tr();
                    }
                  },
                  controller: context.read<RegisterCubit>().nameController,
                ),
                verticalSpace(20),
                AppTextFormField(
                  hintText: 'email'.tr(),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isEmailValid(value)) {
                      return 'valid_email'.tr();
                    }
                  },
                  controller: context.read<RegisterCubit>().emailController,
                ),
                verticalSpace(20),
                AppTextFormField(
                  hintText: 'phone_number'.tr(),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isPhoneNumberValid(value)) {
                      return 'valid_phone_number'.tr();
                    }
                  },
                  controller:
                  context.read<RegisterCubit>().phoneNumberController,
                ),
                verticalSpace(20),
                AppDropdownFormField<String>(
                  labelText: 'select_branch'.tr(),
                  value: selectBranch,
                  items: state.branches
                      .map<DropdownMenuItem<String>>((BranchesResult branch) {
                    return DropdownMenuItem<String>(
                      value: branch.branchname,
                      child: Text(branch.branchname),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectBranch = newValue;
                    });
                  },
                ),
                verticalSpace(18),
                verticalSpace(24),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class AppDropdownFormField<T> extends StatelessWidget {
  final String labelText;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  const AppDropdownFormField({
    Key? key,
    required this.labelText,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.mainBlue,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.lighterGray,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

import 'package:cubic_task/modules/module1/view/screens/register/widgets/register_form.dart';
import 'package:cubic_task/modules/module1/view/screens/register/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import 'logic/cubit/auth_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'welcome'.tr(),
                    style: TextStyles.font24BlueBold,
                  ),
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const RegisterForms(),
                    verticalSpace(24),
                    AppTextButton(
                      buttonText: "register".tr(),
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(60),
                    verticalSpace(25),
                    SvgPicture.asset(
                      'assets/logo/cubic-logo-dark@2.svg',
                      color: Colors.blue,
                    ),
                    verticalSpace(30),
                    AppTextButton(
                      buttonText: "change_language".tr(),
                      textStyle: TextStyles.font16WhiteMedium,
                      onPressed: () {
                        _showLanguageBottomSheet(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      //  context.read<RegisterCubit>().emitLoginStates();
    }
  }

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('english'.tr()),
                onTap: () {
                  context.setLocale(Locale('en'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('arabic'.tr()),
                onTap: () {
                  context.setLocale(Locale('ar'));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

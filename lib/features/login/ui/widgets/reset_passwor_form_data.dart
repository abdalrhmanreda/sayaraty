import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/components/app_text_form_feild.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../logic/login_cubit.dart';

class ResetPasswordFormData extends StatefulWidget {
  const ResetPasswordFormData({super.key});

  @override
  State<ResetPasswordFormData> createState() => _ResetPasswordFormDataState();
}

class _ResetPasswordFormDataState extends State<ResetPasswordFormData> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().resetPasswordFormKey,
      child: Column(
        children: [
          Spacing.verticalSpace(25),
          AppTextFormField(
            controller: context.read<LoginCubit>().newPasswordController,
            label: AppLocalizations.of(context)!.newPassword,
            hint: AppLocalizations.of(context)!.examplePassword,
            type: TextInputType.visiblePassword,
            unFocusBorderColor: AppColors.kGrayColor,
            validate: (value) {
              if (!AppRegex.isPasswordValid(value!)) {
                return AppLocalizations.of(context)!.passwordShouldContain;
              } else if (value.isEmpty) {
                return AppLocalizations.of(context)!.passwordEmpty;
              }
              return null;
            },
            suffixPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            isPassword: !isPasswordVisible,
            suffixIcon:
                isPasswordVisible
                    ? Iconsax.eye_outline
                    : Iconsax.eye_slash_outline,
          ),
          Spacing.verticalSpace(25),
          AppTextFormField(
            controller: context.read<LoginCubit>().confirmPasswordController,
            label: AppLocalizations.of(context)!.confirmPassword,
            hint: AppLocalizations.of(context)!.examplePassword,
            type: TextInputType.visiblePassword,
            unFocusBorderColor: AppColors.kGrayColor,
            validate: (value) {
              if (!AppRegex.isPasswordValid(value!)) {
                return AppLocalizations.of(context)!.passwordShouldContain;
              } else if (value.isEmpty) {
                return AppLocalizations.of(context)!.passwordEmpty;
              } else if (value !=
                  context.read<LoginCubit>().newPasswordController.text) {
                return AppLocalizations.of(context)!.passwordDoesNotMatch;
              }
              return null;
            },
            suffixPressed: () {
              setState(() {
                isConfirmPasswordVisible = !isConfirmPasswordVisible;
              });
            },
            isPassword: !isConfirmPasswordVisible,
            suffixIcon:
                isConfirmPasswordVisible
                    ? Iconsax.eye_outline
                    : Iconsax.eye_slash_outline,
          ),
        ],
      ),
    );
  }
}

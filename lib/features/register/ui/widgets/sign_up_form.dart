import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/components/app_text_form_feild.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../logic/sign_up_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key, this.onFieldChanged});
  final String? Function(String?)? onFieldChanged;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignUpCubit>().nameController,
            label: AppLocalizations.of(context)!.fullName,
            hint: AppLocalizations.of(context)!.fullNameExample,
            type: TextInputType.name,
            onChanged: (value) {
              widget.onFieldChanged!(value);
              return null;
            },
            unFocusBorderColor: AppColors.kGrayColor,
            validate: (value) {
              if (value!.isEmpty) {
                return AppLocalizations.of(context)!.fNameEmpty;
              }
              return null;
            },
          ),
          Spacing.verticalSpace(15),
          AppTextFormField(
            controller: context.read<SignUpCubit>().emailController,
            label: AppLocalizations.of(context)!.email,
            hint: AppLocalizations.of(context)!.exampleEmail,
            type: TextInputType.emailAddress,
            onChanged: (value) {
              widget.onFieldChanged!(value);
              return null;
            },
            unFocusBorderColor: AppColors.kGrayColor,
            validate: (value) {
              if (!AppRegex.isEmailValid(value!)) {
                return AppLocalizations.of(context)!.emailValidation;
              } else if (value.isEmpty) {
                return AppLocalizations.of(context)!.emailEmpty;
              }
              return null;
            },
          ),
          Spacing.verticalSpace(15),
          AppTextFormField(
            controller: context.read<SignUpCubit>().addressController,
            label: AppLocalizations.of(context)!.currentAddress,
            hint: AppLocalizations.of(context)!.currentAddressExample,
            type: TextInputType.text,
            onChanged: (value) {
              widget.onFieldChanged!(value);
              return null;
            },
            unFocusBorderColor: AppColors.kGrayColor,
            validate: (value) {
              if (value!.isEmpty) {
                return AppLocalizations.of(context)!.cAddressEmpty;
              }
              return null;
            },
          ),
          Spacing.verticalSpace(15),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  controller: context.read<SignUpCubit>().zipCodeController,
                  label: AppLocalizations.of(context)!.zipCode,
                  hint: AppLocalizations.of(context)!.zipExample,
                  type: TextInputType.number,
                  onChanged: (value) {
                    widget.onFieldChanged!(value);
                    return null;
                  },
                  unFocusBorderColor: AppColors.kGrayColor,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.zipEmpty;
                    }
                    return null;
                  },
                ),
              ),
              Spacing.horizontalSpace(10),
              Expanded(
                child: AppTextFormField(
                  controller: context.read<SignUpCubit>().cityController,
                  label: AppLocalizations.of(context)!.city,
                  hint: AppLocalizations.of(context)!.cityExample,
                  type: TextInputType.text,
                  onChanged: (value) {
                    widget.onFieldChanged!(value);
                    return null;
                  },
                  unFocusBorderColor: AppColors.kGrayColor,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.cityEmpty;
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Spacing.verticalSpace(15),
          AppTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            label: AppLocalizations.of(context)!.password,
            hint: AppLocalizations.of(context)!.examplePassword,
            type: TextInputType.visiblePassword,
            isPassword: !isPasswordVisible,
            onChanged: (value) {
              widget.onFieldChanged!(value);
              return null;
            },
            suffixIcon: isPasswordVisible
                ? Iconsax.eye_outline
                : Iconsax.eye_slash_outline,
            unFocusBorderColor: AppColors.kGrayColor,
            suffixPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            validate: (value) {
              if (!AppRegex.isPasswordValid(value!)) {
                return AppLocalizations.of(context)!.passwordShouldContain;
              } else if (value.isEmpty) {
                return AppLocalizations.of(context)!.passwordEmpty;
              }
              return null;
            },
          ),
          Spacing.verticalSpace(15),
          AppTextFormField(
            controller: context.read<SignUpCubit>().confirmPasswordController,
            label: AppLocalizations.of(context)!.confirmPassword,
            hint: AppLocalizations.of(context)!.examplePassword,
            type: TextInputType.visiblePassword,
            isPassword: !isConfirmPasswordVisible,
            onChanged: (value) {
              widget.onFieldChanged!(value);
              return null;
            },
            suffixIcon: isConfirmPasswordVisible
                ? Iconsax.eye_outline
                : Iconsax.eye_slash_outline,
            unFocusBorderColor: AppColors.kGrayColor,
            suffixPressed: () {
              setState(() {
                isConfirmPasswordVisible = !isConfirmPasswordVisible;
              });
            },
            validate: (value) {
              if (value !=
                  context.read<SignUpCubit>().passwordController.text) {
                return AppLocalizations.of(context)!.passwordDoesNotMatch;
              } else if (value!.isEmpty) {
                return AppLocalizations.of(context)!.passwordEmpty;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

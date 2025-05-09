import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/components/app_text_form_feild.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../logic/login_cubit.dart';

class LoginDataForm extends StatefulWidget {
  const LoginDataForm({super.key, this.onFieldChanged});

  final String? Function(String?)? onFieldChanged;

  @override
  State<LoginDataForm> createState() => _LoginDataFormState();
}

class _LoginDataFormState extends State<LoginDataForm> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
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
          Spacing.verticalSpace(25),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            label: AppLocalizations.of(context)!.password,
            hint: AppLocalizations.of(context)!.examplePassword,
            type: TextInputType.visiblePassword,
            isPassword: !isPasswordVisible,
            onChanged: (value) {
              widget.onFieldChanged!(value);
              return null;
            },
            suffixIcon:
                isPasswordVisible
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
        ],
      ),
    );
  }
}

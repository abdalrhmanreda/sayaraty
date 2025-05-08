import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sayaraty/core/helpers/spacing.dart';
import 'package:sayaraty/features/login/logic/login_cubit.dart';

import '../widgets/user_input_feild.dart';

class UserInput extends StatelessWidget {
  const UserInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          UserInputFeild(
            isPassword: false,
            controller: context.read<LoginCubit>().emailController,
            hintText: 'example@gmail.com',
            titleText: AppLocalizations.of(context)!.email,
          ),
          Spacing.verticalSpace(20),
          UserInputFeild(
            isPassword: true,
            controller: context.read<LoginCubit>().passwordController,
            hintText: '********',
            titleText: AppLocalizations.of(context)!.password,
            icon: context.read<LoginCubit>().suffix,
            onTap: () {
              context.read<LoginCubit>().changePasswordVisibility();
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sayaraty/core/di/dependancy_injection.dart';
import 'package:sayaraty/features/login/ui/widgets/app_name_and_logo.dart';
import 'package:sayaraty/features/register/logic/register_cubit.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';
import '../../../login/ui/widgets/user_input_feild.dart';
import '../../logic/register_states.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        builder:
            (context, state) => Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppNameAndLogo(),
                    Spacing.verticalSpace(10),
                    Text(
                      AppLocalizations.of(context)!.welcomeToSayaraty,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: getResponsiveFontSize(context, fontSize: 25),
                        fontWeight: FontWeightHelper.medium,
                      ),
                    ),
                    Spacing.verticalSpace(5),
                    Text(
                      AppLocalizations.of(context)!.welcomeBackDescription,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: getResponsiveFontSize(context, fontSize: 16),
                        fontWeight: FontWeightHelper.regular,
                        color: AppColors.kGreyColor,
                      ),
                    ),
                    Spacing.verticalSpace(30),
                    UserInfoInput(),
                  ],
                ),
              ),
            ),
        listener: (context, state) {},
      ),
    );
  }
}

class UserInfoInput extends StatelessWidget {
  const UserInfoInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: UserInputFeild(
                isPassword: false,
                controller: context.read<RegisterCubit>().firstNameController,
                hintText: 'First Name',
                titleText: AppLocalizations.of(context)!.firstName,
              ),
            ),
            Spacing.horizontalSpace(10),
            Expanded(
              child: UserInputFeild(
                isPassword: false,
                controller: context.read<RegisterCubit>().lastNameController,
                hintText: 'Last Name',
                titleText: AppLocalizations.of(context)!.lastName,
              ),
            ),
          ],
        ),
        Spacing.verticalSpace(10),
        UserInputFeild(
          isPassword: false,
          controller: context.read<RegisterCubit>().emailController,
          hintText: 'example@gmail.com',
          titleText: AppLocalizations.of(context)!.email,
        ),
        UserInputFeild(
          isPassword: true,
          controller: context.read<RegisterCubit>().passwordController,
          hintText: '********',
          titleText: AppLocalizations.of(context)!.password,
          icon: context.read<RegisterCubit>().suffix,
          onTap: () {
            context.read<RegisterCubit>().changePasswordVisibility();
          },
        ),
      ],
    );
  }
}

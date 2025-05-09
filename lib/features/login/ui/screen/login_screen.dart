import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sayaraty/config/colors/app_colors.dart';
import 'package:sayaraty/config/themes/font_weight.dart';
import 'package:sayaraty/core/components/custom_button.dart';
import 'package:sayaraty/core/di/dependancy_injection.dart';
import 'package:sayaraty/core/helpers/spacing.dart';
import 'package:sayaraty/core/methods/get_responsive_text/responsive_text.dart';
import 'package:sayaraty/features/login/logic/login_cubit.dart';
import 'package:sayaraty/features/login/logic/login_states.dart';

import '../widgets/app_name_and_logo.dart';
import '../widgets/do_not_have_account.dart';
import '../widgets/user_inputs.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginStates>(
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
                      AppLocalizations.of(context)!.welcomeBack,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: getResponsiveFontSize(context, fontSize: 30),
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
                    UserInput(),
                    Spacing.verticalSpace(15),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          AppLocalizations.of(context)!.forgotPassword,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            fontSize: getResponsiveFontSize(
                              context,
                              fontSize: 15,
                            ),
                            fontWeight: FontWeightHelper.regular,
                            color: AppColors.kGreyColor,
                          ),
                        ),
                      ),
                    ),
                    Spacing.verticalSpace(20),
                    CustomButton(
                      onPressed: () {
                        if (context
                            .read<LoginCubit>()
                            .formKey
                            .currentState!
                            .validate()) {}
                      },
                      text: AppLocalizations.of(context)!.signIn,
                    ),
                    Spacing.verticalSpace(10),

                    DoNotHaveAccount(),
                  ],
                ),
              ),
            ),
        listener: (context, state) {},
      ),
    );
  }
}

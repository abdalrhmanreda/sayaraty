import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sayaraty/core/helpers/extensions.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/routes/routes_path.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/components/app_text_form_feild.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/di/dependancy_injection.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';
import '../../logic/login_cubit.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Iconsax.arrow_left_outline),
                onPressed: () {
                  context.navigateAndFinishNyNamed(context, RoutePath.login);
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: context.read<LoginCubit>().forgotPasswordFormKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 35.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(
                          context,
                        )!.forgotPassword.replaceAll('?', ''),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: getResponsiveFontSize(
                            context,
                            fontSize: 28,
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacing.verticalSpace(15),
                      Text(
                        AppLocalizations.of(
                          context,
                        )!.forgotPasswordSubTitle.replaceAll('?', ''),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: getResponsiveFontSize(
                            context,
                            fontSize: 20,
                          ),
                          fontWeight: FontWeightHelper.regular,
                          color: AppColors.kGreyColor,
                        ),
                      ),
                      Spacing.verticalSpace(50),
                      AppTextFormField(
                        controller:
                            context
                                .read<LoginCubit>()
                                .forgotPasswordEmailController,
                        label: AppLocalizations.of(context)!.email,
                        hint: AppLocalizations.of(context)!.exampleEmail,
                        type: TextInputType.emailAddress,
                        unFocusBorderColor: AppColors.kGrayColor,
                        validate: (value) {
                          if (!AppRegex.isEmailValid(value!)) {
                            return AppLocalizations.of(
                              context,
                            )!.emailValidation;
                          } else if (value.isEmpty) {
                            return AppLocalizations.of(context)!.emailEmpty;
                          }
                          return null;
                        },
                      ),
                      Spacing.verticalSpace(20),
                      CustomButton(
                        height: 56.h,
                        radius: 20.r,
                        onPressed: () {
                          if (context
                              .read<LoginCubit>()
                              .forgotPasswordFormKey
                              .currentState!
                              .validate()) {
                            // context.navigateToWidget(
                            //   context,
                            //   // const ResetEmailSentScreen(),
                            // );
                          }
                        },
                        text: AppLocalizations.of(context)!.resetPassword,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

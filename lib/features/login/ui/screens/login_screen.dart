import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/di/dependancy_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';
import '../../logic/login_cubit.dart';
import '../widgets/do_not_have_account.dart';
import '../widgets/login_data_form.dart';
import '../widgets/login_with_google_button.dart';
import '../widgets/remember_me.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final isFormValid = state is LoginFormValid && state.isValid;
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 25.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.loginTitle,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: getResponsiveFontSize(
                            context,
                            fontSize: 28,
                          ),
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),
                      Spacing.verticalSpace(20),
                      Text(
                        AppLocalizations.of(context)!.loginSubTitle,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: getResponsiveFontSize(
                            context,
                            fontSize: 20,
                          ),
                          fontWeight: FontWeightHelper.regular,
                          color: AppColors.kGrayColor,
                        ),
                      ),
                      Spacing.verticalSpace(35),
                      LoginDataForm(
                        onFieldChanged: (value) {
                          context.read<LoginCubit>().checkFormValidity();
                          return null;
                        },
                      ),
                      Spacing.verticalSpace(20),
                      const RememberMe(),
                      CustomButton(
                        height: 56.h,
                        radius: 20.r,
                        onPressed: () {
                          if (context
                              .read<LoginCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            // context.navigateToWidget(
                            //     context, const LayoutScreen());
                          }
                        },
                        text: AppLocalizations.of(context)!.login,
                        color:
                            isFormValid
                                ? AppColors.kPrimaryColor
                                : AppColors.kGrayColor,
                      ),
                      Spacing.verticalSpace(20),
                      Center(
                        child: Text(
                          AppLocalizations.of(context)!.or,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            fontSize: getResponsiveFontSize(
                              context,
                              fontSize: 17,
                            ),
                            fontWeight: FontWeightHelper.regular,
                            color: AppColors.kGrayColor,
                          ),
                        ),
                      ),
                      Spacing.verticalSpace(20),
                      const LoginWithGoogleButton(),
                      Spacing.verticalSpace(20),
                      const DonotHaveAccount(),
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

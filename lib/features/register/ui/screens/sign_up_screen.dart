import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';
import '../../logic/sign_up_cubit.dart';
import '../widgets/aleady_have_account.dart';
import '../widgets/sign_up_form.dart';
import '../widgets/terms_and_conditions.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final isFormValid = state is SignUpFormValid && state.isValid;

          return Scaffold(
            // appBar: AppBar(
            //   centerTitle: true,
            //   title: Text(
            //     AppLocalizations.of(context)!.register,
            //     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //       fontSize: getResponsiveFontSize(context, fontSize: 20),
            //       fontWeight: FontWeightHelper.bold,
            //     ),
            //   ),
            // ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 25.w,
                    left: 25.w,
                    bottom: 10.h,
                    top: 25.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.registerTitle,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: getResponsiveFontSize(
                            context,
                            fontSize: 26,
                          ),
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),
                      Spacing.verticalSpace(15),
                      Text(
                        AppLocalizations.of(context)!.registerSubTitle,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: getResponsiveFontSize(
                            context,
                            fontSize: 18,
                          ),
                          fontWeight: FontWeightHelper.regular,
                          color: AppColors.kGrayColor,
                        ),
                      ),
                      Spacing.verticalSpace(15),
                      SignUpForm(
                        onFieldChanged: (value) {
                          context.read<SignUpCubit>().checkFormValidity();
                          return null;
                        },
                      ),
                      Spacing.verticalSpace(10),
                      const TermsAndConditions(),
                      Spacing.verticalSpace(15),
                      CustomButton(
                        height: 56.h,
                        radius: 20.r,
                        onPressed: () {
                          if (context
                              .read<SignUpCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            context
                                .read<SignUpCubit>()
                                .signUpWithEmailAndPassword(
                                  phoneNumber: phoneNumber,
                                );
                          }
                        },
                        text: AppLocalizations.of(context)!.continueButton,
                        color:
                            isFormValid
                                ? AppColors.kPrimaryColor
                                : AppColors.kGrayColor,
                      ),
                      Spacing.verticalSpace(10),
                      const AlreadyHaveAnAccount(),
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

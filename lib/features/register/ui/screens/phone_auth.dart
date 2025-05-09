import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayaraty/core/helpers/extensions.dart';
import 'package:sayaraty/features/register/ui/screens/verification_code.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';
import '../../logic/sign_up_cubit.dart';
import '../widgets/phone_auth_input.dart';

class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 35.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.welcome,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: getResponsiveFontSize(
                            context,
                            fontSize: 28,
                          ),
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),
                      Spacing.verticalSpace(10),
                      Text(
                        AppLocalizations.of(context)!.welcomeSubTitle,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: getResponsiveFontSize(
                            context,
                            fontSize: 20,
                          ),
                          fontWeight: FontWeightHelper.regular,
                          color: AppColors.kGrayColor,
                        ),
                      ),
                      Spacing.verticalSpace(30),
                      const PhoneNumberInput(),
                      Spacing.verticalSpace(20),
                      CustomButton(
                        onPressed: () {
                          if (context
                              .read<SignUpCubit>()
                              .phoneFormKey
                              .currentState!
                              .validate()) {
                            context.navigateToWidget(
                              context,
                              OtpVerificationScreen(
                                phoneNumber:
                                    context
                                        .read<SignUpCubit>()
                                        .phoneController
                                        .text,
                              ),
                            );
                          }
                        },
                        text: AppLocalizations.of(context)!.continueButton,
                        height: 56.h,
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

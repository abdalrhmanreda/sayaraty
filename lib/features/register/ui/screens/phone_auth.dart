import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:sayaraty/core/constant/app_constant.dart';
import 'package:sayaraty/features/register/ui/screens/verification_code.dart';
import 'package:sayaraty/generated/assets.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/animation/transactions.dart';
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
          if (state is PhoneNumberVerificationInProgress) {
            // Show the loading dialog when the verification is in progress
            showDialog(
              context: context,
              barrierDismissible: false,
              // Prevent dismissing dialog by tapping outside
              builder: (BuildContext context) {
                return Center(
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: AppConstant.deviceWidth(context) / 1.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ), // Border radius for the dialog
                      ),
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SpinKitCubeGrid(
                            color: AppColors.kPrimaryColor,
                            size: 60.0,
                          ),
                          SizedBox(height: 25.0),
                          Text(
                            "Please wait while we\nverify your phone number...",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          if (state is PhoneNumberVerificationCodeSent) {
            // Once the code is sent, close the dialog
            Navigator.pop(context);
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return Center(
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.all(25.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Lottie.asset(
                            Assets.imagesDone,
                            width: 80,
                            height: 80,
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            "Code sent to your phone number.\nPlease check your SMS.",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          TextButton(
                            onPressed: () {
                              // Navigate to the next screen or perform any action
                              Navigator.pushAndRemoveUntil(
                                context,
                                ScaleTransitionPage(
                                  OtpVerificationScreen(
                                    phoneNumber: state.phoneNumber,
                                    verificationId: state.verificationId,
                                  ),
                                ),
                                (Route<dynamic> route) => false,
                              );
                              // You can navigate to the next screen here
                            },
                            child: Text(
                              "OK",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: AppColors.kPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          if (state is PhoneNumberVerificationFailed) {
            // If the verification fails, show an error dialog
            Navigator.pop(context); // Close the loading dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text(state.errorMessage),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
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
                            context.read<SignUpCubit>().verifyPhoneNumber(
                              phoneNumber:
                                  context
                                      .read<SignUpCubit>()
                                      .phoneController
                                      .text,
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

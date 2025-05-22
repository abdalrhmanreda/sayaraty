import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayaraty/core/di/dependancy_injection.dart';
import 'package:sayaraty/features/register/logic/sign_up_cubit.dart';
import 'package:sayaraty/features/register/ui/screens/sign_up_screen.dart';

import '../../../../core/animation/transactions.dart';
import '../../../../core/helpers/spacing.dart';
import '../widgets/otp_part_one.dart';
import '../widgets/otp_pin_field.dart';
import '../widgets/resend_code_widget.dart';
import '../widgets/submit_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({
    super.key,
    required this.phoneNumber,
    required this.verificationId,
  });

  final String phoneNumber;
  final String verificationId;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  int seconds = 60;
  Timer? _timer; // Declare a Timer object

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        if (mounted) {
          // Check if the widget is still mounted
          setState(() {
            seconds--;
          });
        }
      } else {
        _timer?.cancel(); // Stop the timer when it reaches 0
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignUpCubit>(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            // Handle successful sign-up
            // For example, navigate to the next screen
            Navigator.pushAndRemoveUntil(
              context,
              ScaleTransitionPage(
                SignUpScreen(phoneNumber: widget.phoneNumber),
              ),
              (Route<dynamic> route) => false,
            );
          } else if (state is SignUpFailure) {
            // Handle sign-up failure
            showDialog(
              context: context,
              builder:
                  (context) => Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(child: Text('invalid verification code')),
                  ),
            );
          }
        },
        builder:
            (context, state) => Scaffold(
              appBar: AppBar(
                title: Text(AppLocalizations.of(context)!.otpVerification),
                centerTitle: true,
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OTPPartOne(phoneNumber: widget.phoneNumber),
                    Spacing.verticalSpace(35),
                    const OtpPinField(),
                    Spacing.verticalSpace(15),
                    SubmitButton(
                      verificationId: widget.verificationId,
                      smsCode: context.read<SignUpCubit>().smsCode,
                    ),
                    Spacing.verticalSpace(15),
                    ResendCodeWidget(
                      seconds: seconds,
                      onResend: () {
                        setState(() {
                          seconds = 60;
                        });
                        startTimer();
                      },
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../widgets/otp_part_one.dart';
import '../widgets/otp_pin_field.dart';
import '../widgets/resend_code_widget.dart';
import '../widgets/submit_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

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
    return Scaffold(
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
            const SubmitButton(),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../config/colors/app_colors.dart';
import '../../logic/sign_up_cubit.dart';

class OtpPinField extends StatefulWidget {
  const OtpPinField({super.key});

  @override
  State<OtpPinField> createState() => _OtpPinFieldState();
}

class _OtpPinFieldState extends State<OtpPinField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: PinCodeTextField(
        length: 6,
        obscureText: false,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          inactiveColor: AppColors.kGrayColor,
          activeColor: AppColors.kGrayColor.withOpacity(.5),
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50.h,
          fieldWidth: 40.w,
          activeFillColor: Colors.white,
          selectedColor: AppColors.kPrimaryColor,
        ),
        animationDuration: const Duration(milliseconds: 300),
        onCompleted: (v) {
          print("Completed");
          context.read<SignUpCubit>().smsCode = v;
        },
        onChanged: (value) {
          print(value);
          context.read<SignUpCubit>().smsCode = value;
        },
        beforeTextPaste: (text) {
          print("Allowing to paste $text");
          return true;
        },
        appContext: context,
      ),
    );
  }
}

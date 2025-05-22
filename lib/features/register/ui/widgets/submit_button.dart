import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/custom_button.dart';
import '../../logic/sign_up_cubit.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.verificationId,
    required this.smsCode,
  });

  final String verificationId;
  final String smsCode;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        context.read<SignUpCubit>().signInWithPhoneNumber(
          verificationId,
          smsCode,
        );
        // context.navigateToWidget(context, const SignUpScreen());
      },
      text: AppLocalizations.of(context)!.submit,
      height: 56.h,
    );
  }
}

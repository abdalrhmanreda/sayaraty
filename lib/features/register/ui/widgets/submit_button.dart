import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayaraty/core/helpers/extensions.dart';

import '../../../../core/components/custom_button.dart';
import '../screens/sign_up_screen.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        context.navigateToWidget(context, const SignUpScreen());
      },
      text: AppLocalizations.of(context)!.submit,
      height: 56.h,
    );
  }
}

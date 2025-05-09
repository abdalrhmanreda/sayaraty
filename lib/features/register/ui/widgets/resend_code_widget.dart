import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';

class ResendCodeWidget extends StatelessWidget {
  final int seconds;
  final VoidCallback onResend;

  const ResendCodeWidget({
    super.key,
    required this.seconds,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.codeSent,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: getResponsiveFontSize(context, fontSize: 16),
            color: AppColors.kGreyColor,
          ),
        ),
        Spacing.horizontalSpace(5),
        seconds == 0
            ? GestureDetector(
              onTap: () {
                onResend();
              },
              child: Text(
                AppLocalizations.of(context)!.resendCode,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: getResponsiveFontSize(context, fontSize: 16),
                  color: AppColors.kPrimaryColor,
                ),
              ),
            )
            : RichText(
              text: TextSpan(
                text: AppLocalizations.of(context)!.resendCodeIn,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: getResponsiveFontSize(context, fontSize: 16),
                  color: AppColors.kGreyColor,
                ),
                children: [
                  TextSpan(
                    text: " $seconds ${AppLocalizations.of(context)!.seconds}",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: getResponsiveFontSize(context, fontSize: 15),
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
      ],
    );
  }
}

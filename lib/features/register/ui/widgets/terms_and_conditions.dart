import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool termsStatus = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Checkbox
        Checkbox(
          value: termsStatus,
          onChanged: (value) {
            setState(() {
              termsStatus = value!;
            });
          },
          activeColor: AppColors.kPrimaryColor,
          checkColor: AppColors.kWhiteColor,
          side: const BorderSide(color: AppColors.kGreyColor, width: 0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        // Text Section
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text: "By creating an account..."
              Text(
                AppLocalizations.of(context)!.byCreateAccount,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: getResponsiveFontSize(context, fontSize: 15),
                  fontWeight: FontWeightHelper.regular,
                  color: AppColors.kGreyColor,
                ),
              ),
              Spacing.verticalSpace(5),
              // Text: "Terms and Conditions"
              GestureDetector(
                onTap: () {
                  // Add navigation or action for terms and conditions
                },
                child: Text(
                  AppLocalizations.of(context)!.termsAndConditions,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: getResponsiveFontSize(context, fontSize: 15),
                    fontWeight: FontWeightHelper.semiBold,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

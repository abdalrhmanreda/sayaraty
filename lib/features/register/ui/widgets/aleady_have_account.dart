import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sayaraty/core/helpers/extensions.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';
import '../../../login/ui/screens/login_screen.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.alreadyHaveAccount,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: getResponsiveFontSize(context, fontSize: 15),
            fontWeight: FontWeightHelper.regular,
            color: AppColors.kGreyColor,
          ),
        ),
        Spacing.horizontalSpace(5),
        GestureDetector(
          onTap: () {
            // Navigator.pushNamed(context, Routes.login);
            context.navigateToWidget(context, const LoginScreen());
          },
          child: Text(
            AppLocalizations.of(context)!.login,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: getResponsiveFontSize(context, fontSize: 15),
              fontWeight: FontWeightHelper.semiBold,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

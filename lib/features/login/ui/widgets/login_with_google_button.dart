import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kLoginWithFacebookColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Brand(Brands.google),
          Spacing.horizontalSpace(10),
          Text(
            AppLocalizations.of(context)!.loginWithGoogle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: getResponsiveFontSize(context, fontSize: 17),
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}

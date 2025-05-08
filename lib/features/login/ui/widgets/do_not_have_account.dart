import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sayaraty/config/colors/app_colors.dart';
import 'package:sayaraty/config/themes/font_weight.dart';
import 'package:sayaraty/core/helpers/spacing.dart';
import 'package:sayaraty/core/methods/get_responsive_text/responsive_text.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width / 3,
              color: AppColors.kGrayColor,
            ),
            Spacing.horizontalSpace(10),
            Text(
              AppLocalizations.of(context)!.or,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: getResponsiveFontSize(context, fontSize: 15),
                fontWeight: FontWeightHelper.regular,
                color: AppColors.kGrayColor,
              ),
            ),
            Spacing.horizontalSpace(10),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width / 3,
              color: AppColors.kGrayColor,
            ),
          ],
        ),
        Spacing.verticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.kGrayColor.withOpacity(.2),
              child: Icon(LineAwesome.google, size: 30, color: Colors.black54),
            ),
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.kGrayColor.withOpacity(.2),
              child: Icon(LineAwesome.apple, size: 30, color: Colors.black54),
            ),
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.kGrayColor.withOpacity(.2),
              child: Icon(
                LineAwesome.facebook,
                size: 30,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        Spacing.verticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.dontHaveAnAccount,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: getResponsiveFontSize(context, fontSize: 15),
                fontWeight: FontWeightHelper.regular,
                color: AppColors.kGreyColor,
              ),
            ),
            Spacing.horizontalSpace(5),
            GestureDetector(
              onTap: () {},
              child: Text(
                AppLocalizations.of(context)!.signUp,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: getResponsiveFontSize(context, fontSize: 15),
                  fontWeight: FontWeightHelper.regular,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

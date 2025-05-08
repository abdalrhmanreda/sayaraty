import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sayaraty/core/helpers/spacing.dart';
import 'package:sayaraty/core/methods/get_responsive_text/responsive_text.dart';
import 'package:sayaraty/generated/assets.dart';

class AppNameAndLogo extends StatelessWidget {
  const AppNameAndLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.imagesWheel, width: 35, height: 35),
        Spacing.horizontalSpace(10),
        Text(
          AppLocalizations.of(context)!.appName,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: getResponsiveFontSize(context, fontSize: 18),
          ),
        ),
      ],
    );
  }
}

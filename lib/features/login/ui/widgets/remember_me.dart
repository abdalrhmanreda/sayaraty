import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sayaraty/core/helpers/extensions.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';
import '../screens/forget_password_screen.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({super.key});

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: rememberMe,
          onChanged: (value) {
            setState(() {
              rememberMe = value!;
            });
          },
          activeColor: AppColors.kPrimaryColor,
          checkColor: AppColors.kWhiteColor,
          side: const BorderSide(color: AppColors.kGreyColor, width: 0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        Text(
          AppLocalizations.of(context)!.rememberMe,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: getResponsiveFontSize(context, fontSize: 15),
            fontWeight: FontWeightHelper.semiBold,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            context.navigateToWidget(context, const ForgetPasswordScreen());
          },
          child: Text(
            AppLocalizations.of(context)!.forgotPassword,
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

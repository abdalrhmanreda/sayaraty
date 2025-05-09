import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:sayaraty/core/helpers/extensions.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';
import '../screens/phone_auth.dart';

class OTPPartOne extends StatelessWidget {
  const OTPPartOne({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.otpVerificationSubTitle,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: getResponsiveFontSize(context, fontSize: 18),
            color: AppColors.kGreyColor,
          ),
        ),
        Spacing.verticalSpace(10),
        Container(
          alignment: Alignment.center,
          width: AppConstant.deviceWidth(context) / 2,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: AppColors.kSkyBlueColor.withOpacity(.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '(+20)$phoneNumber',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              ),
              Spacing.horizontalSpace(10),
              GestureDetector(
                onTap: () {
                  context.navigateToWidget(context, const PhoneAuthScreen());
                },
                child: const Icon(IconlyBroken.edit_square, size: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

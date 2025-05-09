// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:home_services/config/themes/font_weight.dart';
// import 'package:home_services/core/methods/get_responsive_text/responsive_text.dart';
//
// import '../../../../config/colors/app_colors.dart';
// import '../../../../core/helpers/spacing.dart';
// import '../../../../generated/assets.dart';
//
// class PasswordUpdatedPartOne extends StatelessWidget {
//   const PasswordUpdatedPartOne({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(Assets.passwordUpdatedPasswordUpdated,
//             width: 200.w, height: 200.h, fit: BoxFit.cover),
//         Text(AppLocalizations.of(context)!.passwordUpdated,
//             style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                   fontSize: getResponsiveFontSize(context, fontSize: 24),
//                   fontWeight: FontWeightHelper.bold,
//                 )),
//         Spacing.verticalSpace(15),
//         Text(AppLocalizations.of(context)!.passwordUpdatedSubTitle,
//             textAlign: TextAlign.center,
//             style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                   fontSize: getResponsiveFontSize(context, fontSize: 18),
//                   fontWeight: FontWeightHelper.regular,
//                   color: AppColors.kGreyColor,
//                 )),
//       ],
//     );
//   }
// }

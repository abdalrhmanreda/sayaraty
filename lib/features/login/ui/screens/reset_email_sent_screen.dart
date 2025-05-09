// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:home_services/config/colors/app_colors.dart';
// import 'package:home_services/config/themes/font_weight.dart';
// import 'package:home_services/core/constant/app_constant.dart';
// import 'package:home_services/core/helpers/extensions.dart';
// import 'package:home_services/core/helpers/spacing.dart';
// import 'package:home_services/core/methods/get_responsive_text/responsive_text.dart';
// import 'package:home_services/features/login/ui/screens/reset_password_screen.dart';
// import 'package:icons_plus/icons_plus.dart';
//
// import '../../../../config/routes/routes_path.dart';
//
// class ResetEmailSentScreen extends StatelessWidget {
//   const ResetEmailSentScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Iconsax.arrow_left_outline),
//           onPressed: () {
//             context.navigateAndFinishNyNamed(context, RoutePath.forgotPassword);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: 25.w,
//           vertical: 25.h,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               AppLocalizations.of(context)!.resetEmailSent,
//               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     fontSize: getResponsiveFontSize(context, fontSize: 28),
//                     fontWeight: FontWeightHelper.bold,
//                   ),
//             ),
//             Spacing.verticalSpace(20),
//             Text(
//               AppLocalizations.of(context)!.resetEmailSentSubTitle,
//               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     fontSize: getResponsiveFontSize(context, fontSize: 20),
//                     fontWeight: FontWeightHelper.regular,
//                     color: AppColors.kGreyColor,
//                   ),
//             ),
//             const Spacer(),
//             GestureDetector(
//               onTap: () {
//                 context.navigateToWidget(context, const ResetPasswordScreen());
//               },
//               child: Center(
//                 child: Container(
//                   height: 56.h,
//                   width: AppConstant.deviceWidth(context) * .8,
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: AppColors.kGrayColor.withOpacity(.5),
//                     ),
//                     borderRadius: BorderRadius.circular(20.r),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(AppLocalizations.of(context)!.goToLogin,
//                           style:
//                               Theme.of(context).textTheme.bodyMedium!.copyWith(
//                                     fontSize: getResponsiveFontSize(context,
//                                         fontSize: 16),
//                                     fontWeight: FontWeightHelper.semiBold,
//                                   )),
//                       Spacing.horizontalSpace(10),
//                       const Icon(
//                         Icons.arrow_forward_rounded,
//                         size: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

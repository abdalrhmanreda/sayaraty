// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../config/colors/app_colors.dart';
// import '../../../../core/components/custom_button.dart';
// import '../widgets/password_updated_part_one.dart';
//
// class PasswordUpdatedScreen extends StatefulWidget {
//   const PasswordUpdatedScreen({super.key});
//
//   @override
//   State<PasswordUpdatedScreen> createState() => _PasswordUpdatedScreenState();
// }
//
// class _PasswordUpdatedScreenState extends State<PasswordUpdatedScreen> {
//   int seconds = 5;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     startTimer();
//   }
//
//   void startTimer() {
//     Future.delayed(const Duration(seconds: 1), () {
//       if (seconds > 0) {
//         setState(() {
//           seconds--;
//         });
//         startTimer();
//       } else {
//         Navigator.pushAndRemoveUntil(
//           context,
//           ScaleTransition1(const LoginScreen()),
//           (Route<dynamic> route) => false,
//         );
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: 25.w,
//           vertical: 25.h,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Spacer(
//               flex: 1,
//             ),
//             const PasswordUpdatedPartOne(),
//             const Spacer(
//               flex: 1,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: AppLocalizations.of(context)!.redirecting,
//                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontSize: getResponsiveFontSize(context, fontSize: 16),
//                       fontWeight: FontWeightHelper.regular,
//                     ),
//                 children: [
//                   TextSpan(
//                       text: " $seconds",
//                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                             fontSize:
//                                 getResponsiveFontSize(context, fontSize: 16),
//                             fontWeight: FontWeightHelper.bold,
//                             color: AppColors.kPrimaryColor,
//                           )),
//                   TextSpan(
//                       text: " ${AppLocalizations.of(context)!.seconds}",
//                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                             fontSize:
//                                 getResponsiveFontSize(context, fontSize: 16),
//                             fontWeight: FontWeightHelper.regular,
//                           )),
//                 ],
//               ),
//             ),
//             CustomButton(
//               height: 56.h,
//               radius: 20.r,
//               text: AppLocalizations.of(context)!.backToLogin,
//               onPressed: () {
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   ScaleTransition1(const LoginScreen()),
//                   (Route<dynamic> route) => false,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

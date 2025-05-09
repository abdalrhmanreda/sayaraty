// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:home_services/config/routes/routes_path.dart';
// import 'package:home_services/config/themes/font_weight.dart';
// import 'package:home_services/core/helpers/extensions.dart';
// import 'package:home_services/core/methods/get_responsive_text/responsive_text.dart';
// import 'package:home_services/features/login/logic/login_cubit.dart';
// import 'package:home_services/features/login/ui/screens/password_updated_screen.dart';
// import 'package:icons_plus/icons_plus.dart';
//
// import '../../../../config/colors/app_colors.dart';
// import '../../../../core/components/custom_button.dart';
// import '../../../../core/di/dependancy_injection.dart';
// import '../../../../core/helpers/spacing.dart';
// import '../widgets/reset_passwor_form_data.dart';
//
// class ResetPasswordScreen extends StatelessWidget {
//   const ResetPasswordScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<LoginCubit>(),
//       child: BlocConsumer<LoginCubit, LoginState>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(
//               leading: IconButton(
//                 icon: const Icon(Iconsax.arrow_left_outline),
//                 onPressed: () {
//                   context.navigateAndFinishNyNamed(
//                       context, RoutePath.resetEmailSent);
//                 },
//               ),
//             ),
//             body: SingleChildScrollView(
//               child: Form(
//                 key: context.read<LoginCubit>().forgotPasswordFormKey,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 25.w,
//                     vertical: 35.h,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         AppLocalizations.of(context)!
//                             .setNewPassword
//                             .replaceAll('?', ''),
//                         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                               fontSize:
//                                   getResponsiveFontSize(context, fontSize: 28),
//                               fontWeight: FontWeight.bold,
//                             ),
//                       ),
//                       Spacing.verticalSpace(15),
//                       Text(
//                         AppLocalizations.of(context)!
//                             .setNewPasswordSubTitle
//                             .replaceAll('?', ''),
//                         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                               fontSize:
//                                   getResponsiveFontSize(context, fontSize: 20),
//                               fontWeight: FontWeightHelper.regular,
//                               color: AppColors.kGreyColor,
//                             ),
//                       ),
//                       const ResetPasswordFormData(),
//                       Spacing.verticalSpace(25),
//                       CustomButton(
//                         height: 56.h,
//                         radius: 20.r,
//                         onPressed: () {
//                           if (context
//                               .read<LoginCubit>()
//                               .forgotPasswordFormKey
//                               .currentState!
//                               .validate()) {
//                             context.navigateToWidget(
//                                 context, const PasswordUpdatedScreen());
//                           }
//                         },
//                         text: AppLocalizations.of(context)!.resetPassword,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

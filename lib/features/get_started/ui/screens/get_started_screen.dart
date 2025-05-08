import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sayaraty/config/colors/app_colors.dart';
import 'package:sayaraty/config/routes/routes_path.dart';
import 'package:sayaraty/config/themes/font_weight.dart';
import 'package:sayaraty/core/cache/shared_pref.dart';
import 'package:sayaraty/core/components/custom_button.dart';
import 'package:sayaraty/core/constant/app_constant.dart';
import 'package:sayaraty/core/helpers/extensions.dart';
import 'package:sayaraty/core/helpers/spacing.dart';
import 'package:sayaraty/core/methods/get_responsive_text/responsive_text.dart';
import 'package:sayaraty/generated/assets.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  double _imageOpacity = 0.0;
  double _textOpacity = 0.0;
  double _buttonOpacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Start fade-in animations in sequence
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => _imageOpacity = 1.0);

      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() => _textOpacity = 1.0);

        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() => _buttonOpacity = 1.0);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: AppColors.kBlackColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () async {
                await SharedPrefService().setBool('isFirstTime', true).then((
                  value,
                ) {
                  context.navigateAndFinishNyNamed(context, RoutePath.login);
                });
              },
              child: Text(
                AppLocalizations.of(context)!.skip,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.kGrayColor,
                  fontSize: getResponsiveFontSize(context, fontSize: 18),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.kBlackColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.verticalSpace(15),
          AnimatedOpacity(
            opacity: _imageOpacity,
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeIn,
            child: Image.asset(
              Assets.getStartedImagesGetStarted,
              height: AppConstant.deviceHeight(context) / 2.1,
              fit: BoxFit.cover,
            ),
          ),
          Spacing.verticalSpace(20),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedOpacity(
                  opacity: _textOpacity,
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeIn,
                  child: Text(
                    AppLocalizations.of(context)!.getStartedTitle,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.kWhiteColor,
                      fontSize: getResponsiveFontSize(context, fontSize: 32),
                      fontWeight: FontWeight.w900,
                      height: 1.4,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                Spacing.verticalSpace(12),
                AnimatedOpacity(
                  opacity: _textOpacity,
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeIn,
                  child: Text(
                    AppLocalizations.of(context)!.gettingStartedDescription,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.kGrayColor,
                      fontSize: getResponsiveFontSize(context, fontSize: 17),
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                ),
                Spacing.verticalSpace(25),
                AnimatedOpacity(
                  opacity: _buttonOpacity,
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeIn,
                  child: CustomButton(
                    onPressed: () async {
                      await SharedPrefService()
                          .setBool('isFirstTime', true)
                          .then((value) {
                            context.navigateAndFinishNyNamed(
                              context,
                              RoutePath.login,
                            );
                          });
                    },
                    text: AppLocalizations.of(context)!.gettingStarted,
                    color: AppColors.kWhiteColor,
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.kBlackColor,
                      fontSize: getResponsiveFontSize(context, fontSize: 18),
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

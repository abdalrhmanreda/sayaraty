import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/routes/router.dart';
import 'config/themes/themes.dart';

class SayaratyApp extends StatelessWidget {
  const SayaratyApp({
    super.key,
    required this.initRoute,
    required this.appRouter,
  });

  final String initRoute;
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 813),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => SafeArea(
            top: false,
            bottom: true,
            child: MaterialApp(
              locale: const Locale('en', 'EG'),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: appRouter.generateRoute,
              theme: Style.lightTheme,
              darkTheme: Style.darkTheme,
              themeMode: ThemeMode.light,
              initialRoute: initRoute,
            ),
          ),
    );
  }
}

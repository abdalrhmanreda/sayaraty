import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayaraty/config/routes/routes_path.dart';
import 'package:sayaraty/core/di/dependancy_injection.dart';
import 'package:sayaraty/features/login/logic/login_cubit.dart';

import '../../features/get_started/ui/screens/get_started_screen.dart';
import '../../features/login/ui/screens/login_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this argument is used to pass data from one screen to another
    final arguments = settings.arguments;
    switch (settings.name) {
      case RoutePath.getStarted:
        return MaterialPageRoute(
          builder: (_) => const GetStartedScreen(),
          settings: settings,
        );
      case RoutePath.login:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen(),
              ),
          settings: settings,
        );
    }
    return null;
  }
}

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:sayaraty/config/routes/router.dart';
import 'package:sayaraty/config/routes/routes_path.dart';
import 'package:sayaraty/core/cache/shared_pref.dart';
import 'package:sayaraty/core/di/dependancy_injection.dart';
import 'package:sayaraty/core/observer/bloc_observer.dart';
import 'package:sayaraty/firebase_options.dart';
import 'package:sayaraty/sayaraty_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefService().init();
  Bloc.observer = MyBlocObserver();

  await setupGetIt();
  String initRoute =
      SharedPrefService().getBool('isFirstTime') != null
          ? RoutePath.login
          : RoutePath.getStarted;
  runApp(SayaratyApp(initRoute: initRoute, appRouter: AppRouter()));
}

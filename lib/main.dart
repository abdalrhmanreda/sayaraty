import 'package:flutter/cupertino.dart';
import 'package:sayaraty/config/routes/router.dart';
import 'package:sayaraty/config/routes/routes_path.dart';
import 'package:sayaraty/core/cache/shared_pref.dart';
import 'package:sayaraty/sayaraty_app.dart';

void main ()async{
  WidgetsFlutterBinding.ensureInitialized() ;
  SharedPrefService().init() ;
  String initRoute = SharedPrefService().getString('isFirstTime') != null?'getStarted' : RoutePath.getStarted ;
  runApp(SayaratyApp(initRoute: initRoute, appRouter: AppRouter(),));
}

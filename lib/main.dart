import 'package:flutter/cupertino.dart';
import 'package:sayaraty/config/routes/router.dart';
import 'package:sayaraty/sayaraty_app.dart';

void main (){
  WidgetsFlutterBinding.ensureInitialized() ;
  runApp(SayaratyApp(initRoute: 'initRoute', appRouter: AppRouter(),));
}
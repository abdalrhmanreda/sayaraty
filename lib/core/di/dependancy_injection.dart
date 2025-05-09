import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:sayaraty/features/login/logic/login_cubit.dart';
import 'package:sayaraty/features/register/logic/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerFactory<LoginCubit>(() => LoginCubit());
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit());
}

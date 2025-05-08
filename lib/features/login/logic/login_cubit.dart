import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:icons_plus/icons_plus.dart';

import 'login_states.dart';

// Define the states

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  var formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPassword = true;
  IconData suffix = Iconsax.eye_outline;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Iconsax.eye_outline : Iconsax.eye_slash_outline;
    emit(LoginChangePasswordVisibilityState());
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var forgotPasswordFormKey = GlobalKey<FormState>();
  var forgotPasswordEmailController = TextEditingController();
  var resetPasswordFormKey = GlobalKey<FormState>();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  void checkFormValidity() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      emit(LoginFormValid(true));
    }
  }
}

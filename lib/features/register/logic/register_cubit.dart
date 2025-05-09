import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sayaraty/features/register/logic/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  var formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final postalCodeController = TextEditingController();

  bool isPassword = true;
  IconData suffix = Iconsax.eye_outline;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Iconsax.eye_outline : Iconsax.eye_slash_outline;
    emit(RegisterChangePasswordVisibilityState());
  }
}

part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

class SignUpFormValid extends SignUpState {
  final bool isValid;
  SignUpFormValid(this.isValid);
}

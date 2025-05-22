part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

class SignUpFormValid extends SignUpState {
  final bool isValid;

  SignUpFormValid(this.isValid);
}

class PhoneNumberVerified extends SignUpState {
  final bool isVerified;

  PhoneNumberVerified(this.isVerified);
}

class PhoneNumberVerificationFailed extends SignUpState {
  final String errorMessage;

  PhoneNumberVerificationFailed(this.errorMessage);
}

class PhoneNumberVerificationInProgress extends SignUpState {}

class PhoneNumberVerificationCompleted extends SignUpState {
  final String verificationId;

  PhoneNumberVerificationCompleted(this.verificationId);
}

class PhoneNumberVerificationCodeSent extends SignUpState {
  final String verificationId;
  final String phoneNumber;

  PhoneNumberVerificationCodeSent(this.verificationId, this.phoneNumber);
}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String error;

  SignUpFailure(this.error);
}

class CreateUserSuccess extends SignUpState {
  final String userId;

  CreateUserSuccess(this.userId);
}

class CreateUserFailure extends SignUpState {
  final String error;

  CreateUserFailure(this.error);
}

class CreateUserLoading extends SignUpState {}

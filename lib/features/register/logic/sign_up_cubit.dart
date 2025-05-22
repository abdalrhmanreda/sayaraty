import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sayaraty/features/register/data/models/user_model.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var zipCodeController = TextEditingController();
  var phoneController = TextEditingController();
  var phoneFormKey = GlobalKey<FormState>();
  String smsCode = '';

  void checkFormValidity() {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        zipCodeController.text.isNotEmpty) {
      emit(SignUpFormValid(true));
    }
  }

  void verifyPhoneNumber({required String phoneNumber}) {
    emit(PhoneNumberVerificationInProgress());
    FirebaseAuth.instance.verifyPhoneNumber(
      timeout: Duration(minutes: 1),
      phoneNumber: '+2$phoneNumber',
      verificationCompleted: (phoneAuthCredential) {
        FirebaseAuth.instance
            .signInWithCredential(phoneAuthCredential)
            .then((value) {
              if (!isClosed) emit(PhoneNumberVerified(true));
            })
            .catchError((error) {
              if (!isClosed) {
                emit(PhoneNumberVerificationFailed(error.toString()));
              }
            });
      },
      verificationFailed: (error) {
        emit(PhoneNumberVerificationFailed(error.message.toString()));
      },
      codeSent: (verificationId, forceResendingToken) {
        emit(PhoneNumberVerificationCodeSent(verificationId, phoneNumber));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        emit(PhoneNumberVerificationFailed('Code auto retrieval timeout'));
      },
    );
  }

  void signInWithPhoneNumber(String verificationId, String smsCode) {
    emit(SignUpLoading());
    final phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    FirebaseAuth.instance
        .signInWithCredential(phoneAuthCredential)
        .then((value) {
          emit(SignUpSuccess());
        })
        .catchError((error) {
          emit(SignUpFailure(error.toString()));
        });
  }

  void signUpWithEmailAndPassword({required String phoneNumber}) {
    emit(SignUpLoading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        )
        .then((value) {
          createUserInFirestore(
            userId: value.user!.uid,
            phoneNumber: phoneNumber,
          );
        })
        .catchError((error) {
          emit(SignUpFailure(error.toString()));
        });
  }

  void createUserInFirestore({
    required String userId,
    required String phoneNumber,
  }) {
    UserModel userModel = UserModel(
      fullName: nameController.text,
      email: emailController.text,
      address: addressController.text,
      city: cityController.text,
      zipCode: zipCodeController.text,
      phoneNumber: phoneNumber,
    );
    emit(CreateUserLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .set(userModel.toJson())
        .then((v) {
          emit(CreateUserSuccess(userId));
        })
        .catchError((error) {
          emit(CreateUserFailure(error.toString()));
        });
    // Implement Firestore user creation logic here
  }
}

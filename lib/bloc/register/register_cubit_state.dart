import 'package:flutter/material.dart';

import '../main/main_state.dart';

@immutable
abstract class RegisterScreenState extends MainCubitState {}

abstract class EmailValidationState extends RegisterScreenState {}

abstract class PasswordValidationState extends RegisterScreenState {}

class RegisterScreenInitial extends RegisterScreenState {
  @override
  List<Object?> get props => [];
}

class RegisterScreenLoadingState extends RegisterScreenState {
  RegisterScreenLoadingState();

  @override
  List<Object?> get props => [];
}

class RegisterScreenSuccessState extends RegisterScreenState {
  final String msg;

  RegisterScreenSuccessState({this.msg = ""});

  @override
  List<Object?> get props => [msg];
}

class UserNameValidationSuccessState extends RegisterScreenState {
  UserNameValidationSuccessState();

  @override
  List<Object?> get props => [];
}

class UserNameValidationFailureState extends RegisterScreenState {
  UserNameValidationFailureState();

  @override
  List<Object?> get props => [];
}

class FirstNameValidationSuccessState extends RegisterScreenState {
  FirstNameValidationSuccessState();

  @override
  List<Object?> get props => [];
}

class FirstNameValidationFailureState extends RegisterScreenState {
  FirstNameValidationFailureState();

  @override
  List<Object?> get props => [];
}

class PhoneValidationSuccessState extends RegisterScreenState {
  PhoneValidationSuccessState();

  @override
  List<Object?> get props => [];
}

class PhoneValidationFailureState extends RegisterScreenState {
  PhoneValidationFailureState();

  @override
  List<Object?> get props => [];
}

class LastNameValidationSuccessState extends RegisterScreenState {
  LastNameValidationSuccessState();

  @override
  List<Object?> get props => [];
}

class ValidNationalityFailureState extends RegisterScreenState {
  ValidNationalityFailureState();

  @override
  List<Object?> get props => [];
}

class ValidNationalitySuccessState extends RegisterScreenState {
  ValidNationalitySuccessState();

  @override
  List<Object?> get props => [];
}

class LastNameValidationFailureState extends RegisterScreenState {
  LastNameValidationFailureState();

  @override
  List<Object?> get props => [];
}

class ValidPasswordSuccessState extends RegisterScreenState {
  ValidPasswordSuccessState();

  @override
  List<Object?> get props => [];
}

class ValidPasswordFailureState extends RegisterScreenState {
  ValidPasswordFailureState();

  @override
  List<Object?> get props => [];
}

class RegisterScreenFailureState extends RegisterScreenState {
  final String errorMsg;
  RegisterScreenFailureState({this.errorMsg = " "});
  @override
  List<Object?> get props => [errorMsg];
}

import 'package:flutter/material.dart';

import '../main/main_state.dart';

@immutable
abstract class LoginScreenState extends MainCubitState {}

class LoginScreenInitial extends LoginScreenState {
  @override
  List<Object?> get props => [];
}

class LoginScreenLoadingState extends LoginScreenState {
  LoginScreenLoadingState();

  @override
  List<Object?> get props => [];
}

class LoginScreenSuccessState extends LoginScreenState {
  final String msg;

  LoginScreenSuccessState({this.msg = ""});

  @override
  List<Object?> get props => [msg];
}

class UserNameValidationSuccessState extends LoginScreenState {
  UserNameValidationSuccessState();

  @override
  List<Object?> get props => [];
}

class UserNameValidationFailureState extends LoginScreenState {
  UserNameValidationFailureState();

  @override
  List<Object?> get props => [];
}

class ValidPasswordSuccessState extends LoginScreenState {
  ValidPasswordSuccessState();

  @override
  List<Object?> get props => [];
}

class ValidPasswordFailureState extends LoginScreenState {
  ValidPasswordFailureState();

  @override
  List<Object?> get props => [];
}

class LoginScreenFailureState extends LoginScreenState {
  final String errorMsg;
  LoginScreenFailureState({this.errorMsg = " "});
  @override
  List<Object?> get props => [errorMsg];
}

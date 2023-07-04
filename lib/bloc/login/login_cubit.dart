import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/bloc/login/login_cubit_state.dart';
import '../../utils/app_utils.dart';
import '../../view/home.dart';
import '../main/main_cubit.dart';

class LoginScreenCubit extends MainCubit<LoginScreenState> {
  LoginScreenCubit([
    LoginScreenState? initialState,
  ]) : super(
          initialState ?? LoginScreenInitial(),
        );

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isValidEmail = true;
  bool isValidPassword = true;

  bool showPassword = true;

  togglePassword() => !showPassword;

  validateEmail() {
    if (isEmail(userNameController.text.trim())) {
      isValidEmail = true;
      emit(UserNameValidationSuccessState());
    } else {
      isValidEmail = false;
      emit(UserNameValidationFailureState());
    }
  }

  validatePassword() {
    if (isValidPassWord(passwordController.text)) {
      isValidPassword = true;
      emit(ValidPasswordSuccessState());
    } else {
      isValidPassword = false;
      emit(ValidPasswordFailureState());
    }
  }

  login(context) {
    validateEmail();
    validatePassword();
    if (isValidEmail & isValidPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      BotToast.showText(text: 'Invalid Details!');
      emit(LoginScreenFailureState());
    }
  }
}

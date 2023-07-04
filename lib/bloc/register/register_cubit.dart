import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/bloc/login/login_cubit.dart';
import 'package:machine_test/bloc/register/register_cubit_state.dart';
import 'package:machine_test/view/login/login_screen.dart';
import '../../utils/app_utils.dart';
import '../main/main_cubit.dart';

class RegisterScreenCubit extends MainCubit<RegisterScreenState> {
  RegisterScreenCubit([
    RegisterScreenState? initialState,
  ]) : super(
          initialState ?? RegisterScreenInitial(),
        );

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  String? selectedGender = '';
  bool isValidEmail = true;
  bool isValidFirstName = true;
  bool isValidLastName = true;
  bool isValidPassword = true;
  bool isValidPhone = true;
  bool isValidNationality = true;

  bool showPassword = true;

  validateFirstName() {
    if (firstName.text.length > 3) {
      isValidFirstName = true;
      emit(FirstNameValidationSuccessState());
    } else {
      isValidFirstName = false;
      emit(FirstNameValidationFailureState());
    }
  }

  validatePhone() {
    if (phoneNumber.text.length > 8) {
      isValidPhone = true;
      emit(PhoneValidationSuccessState());
    } else {
      isValidPhone = false;
      emit(PhoneValidationFailureState());
    }
  }

  validateLastName() {
    if (lastName.text.length > 3) {
      isValidLastName = true;
      emit(LastNameValidationSuccessState());
    } else {
      isValidLastName = false;
      emit(LastNameValidationFailureState());
    }
  }

  validateEmail() {
    if (isEmail(userNameController.text.trim())) {
      isValidEmail = true;
      emit(UserNameValidationSuccessState());
    } else {
      isValidEmail = false;
      emit(UserNameValidationFailureState());
    }
  }

  validateNationality() {
    if (nationality.text.length > 5) {
      isValidNationality = true;
      emit(ValidNationalitySuccessState());
    } else {
      isValidNationality = false;
      emit(ValidNationalityFailureState());
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

  register(context) {
    validateEmail();
    validatePassword();
    validateFirstName();
    validateLastName();
    validatePhone();
    validateNationality();
    if (isValidEmail &&
        isValidPassword &&
        isValidFirstName &&
        isValidLastName &&
        isValidPhone &&
        isValidNationality) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (_) => LoginScreenCubit(),
                  child: LoginScreen(),
                )),
      );
    } else {
      emit(RegisterScreenFailureState());
      BotToast.showText(text: 'Invalid Details!');
    }
  }
}

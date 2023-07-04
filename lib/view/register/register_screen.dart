import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/bloc/login/login_cubit.dart';
import 'package:machine_test/utils/app_colors.dart';
import 'package:machine_test/widgets/gender_selector.dart';
import 'package:machine_test/widgets/phone_number_field.dart';
import 'package:machine_test/bloc/register/register_cubit.dart';
import 'package:machine_test/bloc/register/register_cubit_state.dart';
import '../../widgets/common_testfield.dart';
import '../../widgets/normal_button.dart';
import '../../widgets/text_widget.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenCubit cubit = RegisterScreenCubit();

  @override
  void initState() {
    cubit = context.read<RegisterScreenCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 200, bottom: 50),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextField(
                  validator: (value) {
                    if (value!.length > 5) {
                      return null;
                    } else {
                      return 'Invalid AEmail';
                    }
                  },
                  bgColor: backGroundWhite,
                  borderColor: themeBlue.withOpacity(.3),
                  onChanged: (value) {
                    cubit.validateFirstName();
                  },
                  hintText: 'FirstName',
                  controller: cubit.firstName,
                ),
                BlocBuilder<RegisterScreenCubit, RegisterScreenState>(
                  builder: (context, state) {
                    if (state is FirstNameValidationSuccessState) {
                      return const SizedBox();
                    } else if (state is FirstNameValidationFailureState ||
                        state is RegisterScreenFailureState) {
                      return TextWidget.CustomTextwidget(
                        text:
                            cubit.isValidFirstName ? "" : 'Invalid First Name',
                        color: Colors.red,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(height: 15),
                CommonTextField(
                  bgColor: backGroundWhite,
                  borderColor: themeBlue.withOpacity(.3),
                  onChanged: (value) {
                    cubit.validateLastName();
                  },
                  hintText: 'Last Name',
                  controller: cubit.lastName,
                ),
                BlocBuilder<RegisterScreenCubit, RegisterScreenState>(
                  builder: (context, state) {
                    if (state is LastNameValidationSuccessState) {
                      return const SizedBox();
                    } else if (state is LastNameValidationFailureState ||
                        state is RegisterScreenFailureState) {
                      return TextWidget.CustomTextwidget(
                        text: cubit.isValidLastName ? "" : 'Invalid Last Name',
                        color: Colors.red,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                GenderSelector(),
                const SizedBox(
                  height: 20,
                ),
                CommonTextField(
                  bgColor: backGroundWhite,
                  borderColor: themeBlue.withOpacity(.3),
                  onChanged: (value) {
                    cubit.validateNationality();
                  },
                  hintText: 'Nationality',
                  controller: cubit.nationality,
                ),
                BlocBuilder<RegisterScreenCubit, RegisterScreenState>(
                  builder: (context, state) {
                    if (state is ValidNationalitySuccessState) {
                      return const SizedBox();
                    } else if (state is ValidNationalityFailureState ||
                        state is RegisterScreenFailureState) {
                      return TextWidget.CustomTextwidget(
                        text: cubit.isValidNationality
                            ? ""
                            : 'Invalid Nationality',
                        color: Colors.red,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                PhoneNumberTextField(
                    onChanged: (val) {
                      cubit.validatePhone();
                    },
                    hintText: 'Contact Number',
                    controller: cubit.phoneNumber),
                BlocBuilder<RegisterScreenCubit, RegisterScreenState>(
                  builder: (context, state) {
                    if (state is PhoneValidationSuccessState) {
                      return const SizedBox();
                    } else if (state is PhoneValidationFailureState ||
                        state is RegisterScreenFailureState) {
                      return TextWidget.CustomTextwidget(
                        text: cubit.isValidPhone ? "" : 'Invalid Contact',
                        color: Colors.red,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                CommonTextField(
                  bgColor: backGroundWhite,
                  borderColor: themeBlue.withOpacity(.3),
                  onChanged: (value) {
                    cubit.validateEmail();
                  },
                  hintText: 'Email ',
                  controller: cubit.userNameController,
                ),
                BlocBuilder<RegisterScreenCubit, RegisterScreenState>(
                  builder: (context, state) {
                    if (state is UserNameValidationSuccessState) {
                      return const SizedBox();
                    } else if (state is UserNameValidationFailureState ||
                        state is RegisterScreenFailureState) {
                      return TextWidget.CustomTextwidget(
                        text: cubit.isValidEmail ? "" : 'Invalid Email Address',
                        color: Colors.red,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CommonTextField(
                  bgColor: backGroundWhite,
                  borderColor: themeBlue.withOpacity(.3),
                  obsecureText: cubit.showPassword,
                  onChanged: (value) {
                    cubit.validatePassword();
                  },
                  hintText: 'Password',
                  controller: cubit.passwordController,
                ),
                const SizedBox(
                  height: 5,
                ),
                BlocBuilder<RegisterScreenCubit, RegisterScreenState>(
                  builder: (context, state) {
                    if (state is ValidPasswordSuccessState) {
                      return const SizedBox();
                    } else if (state is ValidPasswordFailureState ||
                        state is RegisterScreenFailureState) {
                      return TextWidget.CustomTextwidget(
                        text: cubit.isValidPassword ? "" : 'Invalid Password',
                        color: Colors.red,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                NormalButton(
                  text: 'REGISTER',
                  onTap: () {
                    cubit.register(context);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    TextWidget.CustomTextwidget(
                        text: 'Already have an account ?',
                        color: textBlack,
                        fontSize: 14),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      child: TextWidget.CustomTextwidget(
                          text: 'Login', color: themeBlue, fontSize: 14),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                    create: (_) => LoginScreenCubit(),
                                    child: LoginScreen(),
                                  )),
                        );
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
        ),
      ),
    ));
  }
}

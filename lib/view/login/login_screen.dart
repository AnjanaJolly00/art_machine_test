import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/bloc/login/login_cubit.dart';
import 'package:machine_test/bloc/register/register_cubit.dart';
import 'package:machine_test/utils/app_colors.dart';
import '../../bloc/login/login_cubit_state.dart';
import '../../utils/app_utils.dart';
import '../../widgets/common_testfield.dart';
import '../../widgets/normal_button.dart';
import '../../widgets/text_widget.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenCubit cubit = LoginScreenCubit();

  @override
  void initState() {
    cubit = context.read<LoginScreenCubit>();
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
                  bgColor: backGroundWhite,
                  borderColor: themeBlue.withOpacity(.3),
                  onChanged: (value) {
                    cubit.validateEmail();
                  },
                  hintText: 'Email/Phone',
                  controller: cubit.userNameController,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: iconColor,
                  ),
                ),
                BlocBuilder<LoginScreenCubit, LoginScreenState>(
                  builder: (context, state) {
                    if (state is UserNameValidationSuccessState) {
                      return const SizedBox();
                    } else if (state is UserNameValidationFailureState ||
                        state is LoginScreenFailureState) {
                      return TextWidget.CustomTextwidget(
                          text:
                              cubit.isValidEmail ? "" : 'Invalid email address',
                          color: Colors.red);
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
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
                  prefixIcon: const Icon(
                    Icons.password_outlined,
                    color: iconColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                BlocBuilder<LoginScreenCubit, LoginScreenState>(
                  builder: (context, state) {
                    if (state is ValidPasswordSuccessState) {
                      return const SizedBox();
                    } else if (state is ValidPasswordFailureState ||
                        state is LoginScreenFailureState) {
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
                  text: 'LOGIN',
                  onTap: () {
                    cubit.login(context);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    TextWidget.CustomTextwidget(
                        text: 'Don\'t have an account ?',
                        color: textBlack,
                        fontSize: 14),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      child: TextWidget.CustomTextwidget(
                          text: 'Register', color: themeBlue, fontSize: 14),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                    create: (_) => RegisterScreenCubit(),
                                    child: RegisterScreen(),
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

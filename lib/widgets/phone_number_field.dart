import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../utils/app_colors.dart';

class PhoneNumberTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obsecureText;
  final TextInputType? textInputType;
  final TextAlign? textAlign;
  final Function(PhoneNumber)? onChanged;
  final bool? readOnly;
  final void Function(Country)? onCountryChanged;
  final int? maxLines;

  const PhoneNumberTextField(
      {required this.hintText,
      required this.controller,
      this.suffixIcon,
      this.validator,
      this.obsecureText,
      this.prefixIcon,
      this.textInputType,
      this.onChanged,
      this.readOnly = false,
      this.maxLines = 1,
      this.onCountryChanged,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      invalidNumberMessage: '',
      initialCountryCode: 'QA',
      showCountryFlag: false,
      disableLengthCheck: true,
      controller: controller,
      onCountryChanged: onCountryChanged ?? (v) {},
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: themeBlue.withOpacity(.3), width: 1)),
        // contentPadding: const EdgeInsets.only(
        //   left: 50,
        //   top: 20,
        // ),
        errorText: '',
        focusedErrorBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: themeBlue.withOpacity(.3), width: 1)),
        border: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: themeBlue.withOpacity(.3), width: 1)),
        focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: themeBlue.withOpacity(.3), width: 1)),
        enabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: themeBlue.withOpacity(.3), width: 1)),
        fillColor: backGroundWhite,
        filled: true,
        isDense: true,
        hintStyle: TextStyle(
          color: iconColor,
          fontSize: 14,
        ),
      ),
    );
  }
}

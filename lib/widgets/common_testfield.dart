import 'package:flutter/material.dart';
import 'package:machine_test/utils/app_colors.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obsecureText;
  final TextInputType? textInputType;
  final TextAlign? textAlign;
  final Function(String)? onChanged;
  final bool? readOnly;
  final int? maxLines;
  final Color bgColor;
  final Color borderColor;
  final TextStyle? hintStyle;
  Key? key;

  CommonTextField(
      {required this.hintText,
      required this.controller,
      this.suffixIcon,
      this.validator,
      this.key,
      this.obsecureText,
      this.prefixIcon,
      this.textInputType,
      this.onChanged,
      this.readOnly = false,
      this.maxLines = 1,
      this.bgColor = backGroundWhite,
      this.hintStyle,
      required this.borderColor,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      padding: const EdgeInsets.only(left: 10, right: 5),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 1)),
      width: double.infinity,
      child: Row(
        children: [
          prefixIcon ?? const SizedBox(),
          Expanded(
            child: TextField(
              readOnly: readOnly!,
              scrollPadding: EdgeInsets.zero,
              maxLines: maxLines!,
              onChanged: onChanged,
              controller: controller,
              cursorColor: textBlack,
              // validator: validator,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              textAlign: textAlign ?? TextAlign.justify,
              keyboardType: textInputType ?? TextInputType.text,
              obscureText: obsecureText ?? false,
              decoration: InputDecoration(
                // contentPadding: const EdgeInsets.only(
                //   // left: 50,
                //   top: 20,
                // ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 1)),

                fillColor: Colors.transparent,
                filled: true,
                isDense: true,
                hintText: hintText,
                hintStyle: hintStyle ??
                    const TextStyle(
                      color: iconColor,
                      fontSize: 14,
                    ),
              ),
            ),
          ),
          suffixIcon ?? const SizedBox()
        ],
      ),
    );
  }
}

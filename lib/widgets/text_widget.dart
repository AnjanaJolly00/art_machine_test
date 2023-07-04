import 'package:flutter/material.dart';
import 'package:machine_test/utils/app_colors.dart';

class TextWidget {
  static CustomTextwidget({
    String? text,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        color: color ?? textBlack,
        fontSize: fontSize,
      ),
    );
  }
}

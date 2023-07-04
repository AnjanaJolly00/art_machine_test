import 'package:flutter/material.dart';
import 'package:machine_test/widgets/text_widget.dart';

import '../utils/app_colors.dart';

class NormalButton extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  final double? height;
  final double borderRadius;
  Key? key;

  NormalButton(
      {this.onTap,
      this.text,
      this.borderRadius = 10,
      this.height = 50,
      this.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            backgroundColor: themeBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget.CustomTextwidget(
                    color: Colors.white, fontSize: 14, text: text),
              ],
            ),
          )

          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
    );
  }
}

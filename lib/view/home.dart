import 'package:flutter/material.dart';
import 'package:machine_test/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextWidget.CustomTextwidget(text: 'Home', fontSize: 25)),
    );
  }
}

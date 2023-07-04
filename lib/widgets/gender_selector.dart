import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class GenderSelector extends StatefulWidget {
  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender;

  List<String> genderOptions = ['Male', 'Female', 'Other'];

  @override
  void initState() {
    selectedGender = genderOptions[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedGender,
      onChanged: (value) {
        setState(() {
          selectedGender = value;
        });
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: themeBlue.withOpacity(.3), width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: themeBlue.withOpacity(.3), width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: themeBlue.withOpacity(.3), width: 1)),
        fillColor: backGroundWhite,
        filled: true,
        isDense: true,
        hintText: 'Gender',
        hintStyle: const TextStyle(
          color: iconColor,
          fontSize: 14,
        ),
      ),
      items: genderOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          alignment: AlignmentDirectional.center,
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

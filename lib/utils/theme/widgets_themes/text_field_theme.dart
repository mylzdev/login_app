import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    prefixIconColor: tSecondaryColor,
    floatingLabelStyle: TextStyle(color: tSecondaryColor),
    border: OutlineInputBorder(),
    suffixIconColor: tSecondaryColor,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: tSecondaryColor),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
    prefixIconColor: tPrimaryColor,
    floatingLabelStyle: TextStyle(color: tPrimaryColor),
    border: OutlineInputBorder(),
    suffixIconColor: tPrimaryColor,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: tPrimaryColor),
    ),
  );
}

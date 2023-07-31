import 'package:flutter/material.dart';
import 'package:login_app/utils/theme/widgets_themes/appbar_theme.dart';
import 'package:login_app/utils/theme/widgets_themes/elevated_button_theme.dart';
import 'package:login_app/utils/theme/widgets_themes/outlined_button_theme.dart';
import 'package:login_app/utils/theme/widgets_themes/text_field_theme.dart';

import 'widgets_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElvatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    appBarTheme: TAppbarTheme.tAppBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElvatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    appBarTheme: TAppbarTheme.tAppBarTheme,
  );
}

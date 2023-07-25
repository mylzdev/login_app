import 'package:flutter/material.dart';
import 'package:login_app/constants/sizes.dart';

import '../../../constants/colors.dart';

class TElvatedButtonTheme {
  TElvatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: tDarkColor,
      foregroundColor: tWhiteColor,
      side: const BorderSide(color: tSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: tSecondaryColor,
      foregroundColor: tWhiteColor,
      side: const BorderSide(color: tSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
}
